class EventsController < ApplicationController
    include EventsHelper

    def new
        @event = Event.new
    end

    def create
        event = Event.new(event_params)
        event.user = current_user
        event.midpoint = Midpoint.first
        
        if event.save 
            flash[:success] = "SUCCESS >>> New Event Created Sucessfully"
        else
            flash[:error] = "ERROR >>> Event Creation Fail #{event.errors.full_messages}"
        end
        respond_to do |format|  
            format.js
        end
    end

    def show
        @event = Event.find(params[:id])
        @colabs = @event.invites
        @users = @colabs.joins(:user)

        longtitude_tot = @users.maximum(:longtitude).to_f + @users.minimum(:longtitude).to_f
        latitude_tot = @users.maximum(:latitude).to_f + @users.minimum(:latitude).to_f
        longtitude_dif = @users.maximum(:longtitude).to_f - @users.minimum(:longtitude).to_f
        latitude_dif = @users.maximum(:latitude).to_f - @users.minimum(:latitude).to_f
        # zoom = 0;
        zoom = 12.8;
        if longtitude_dif > latitude_dif 
            # zoom = longtitude_dif * 45.614104674
        else
            # zoom = latitude_dif * 45.614104674
        end
        @center = [ longtitude_tot / 2, latitude_tot / 2 , zoom]
        @Locresults = Midpoint.all
    end

    def detail
        @event = Event.find(params[:id])
        respond_to do |format|  
            format.js
        end
    end

    def event_map
        bundle, user_location, target_location, midpoint_all_location = [], [], [], []
        colabs = Event.find(params[:event_id]).invites
        midpoints = Midpoint.all

        colabs.each do |i|
            u = i.user
            user_location << {
                "id": "poi.1580547980092", #get from database
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "description": "<img src='https://i.ibb.co/yPYz8x4/ruby-pin.gif' height='142' width='100'> 
                        <br> #{u.username} 
                        <br> Coordinates: #{u.longtitude}, #{u.latitude} 
                        <br> Language: <span class='user_lang'> #{u.lang} </span>
                        <br> User ID: #<span class='user_id'>#{u.id}</span>
                        <br><button id='#{u.id}' class='colab-btn'>Collaborate!</button>", #
                    "landmark": true,
                    "category": "college, university, building",
                    "iconSize": [60, 60],
                    "lang": "#{u.lang}",
                },
                "text": "Next Academy",
                "place_name": "Next Academy, Kuala Lumpur, 60000, Malaysia",
                "center": [u.longtitude, u.latitude], #
                "geometry": {
                    "coordinates": [u.longtitude, u.latitude], #
                    "type": "Point"
                }
            }
        end
        user = {"type": "FeatureCollection", "features":  user_location}
    

        #detect outlier
        #remove outlier
        #using SD as limit
        lng_arr = DescriptiveStatistics::Stats.new([])
        lat_arr = DescriptiveStatistics::Stats.new([])
        colabs.each do |i|
            lng_arr << i.user.longtitude.to_f
            lat_arr << i.user.latitude.to_f
        end
        lng_arr = lng_arr.sort
        lat_arr = lat_arr.sort

        lng_s_d = s_d(lng_arr)
        lat_s_d = s_d(lat_arr)
        
        #take SD limit of 0.06
        #what is the radius?
        s_d_limit = 0.2
        lng_arr_length = lng_arr.length
        colabs = colabs.joins(:user)
        
        
        while lng_s_d > s_d_limit
            lng_arr = eval_lower(lng_arr)
            if lng_arr.length < lng_arr_length
                colabs = colabs.where("longtitude != ?", colabs.minimum(:longtitude).to_s)
                lng_arr_length = lng_arr.length
            end
            
            lng_arr = eval_upper(lng_arr)
            if lng_arr.length < lng_arr_length
                colabs = colabs.where("longtitude != ?", colabs.maximum(:longtitude).to_s)
                lng_arr_length = lng_arr.length
            end
            lng_s_d = s_d(lng_arr)
        end

        # only search within radius
        max_lat = colabs.maximum(:latitude).to_f 
        min_lat = colabs.minimum(:latitude).to_f 
        max_lng = colabs.maximum(:longtitude).to_f
        min_lng = colabs.minimum(:longtitude).to_f
        
        # search for midpoint within
        midpoints = midpoints.where("longtitude < ? AND longtitude > ? AND latitude < ? AND latitude > ?", max_lng, min_lng, max_lat, min_lat)

        midpoints.all.each do |p|
            target_location << {
                "id": "#{p.poi}",
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "name": "#{p.name}", #
                    "address": "#{p.address}",
                    "description": "#{p.description}", #
                    "category": "#{p.category}",
                    "landmark": true,
                },
                "center": [p.longtitude, p.latitude], #
                "geometry": {
                    "coordinates": [p.longtitude, p.latitude], #
                    "type": "Point",
                }
            }
        end
        target = {"type": "FeatureCollection", "features":  target_location}


        Midpoint.all.each do |p|
            midpoint_all_location << {
                "id": "#{p.poi}",
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "name": "#{p.name}", #
                    "address": "#{p.address}",
                    "description": "#{p.description}", #
                    "category": "#{p.category}",
                    "landmark": true,
                },
                "center": [p.longtitude, p.latitude], #
                "geometry": {
                    "coordinates": [p.longtitude, p.latitude], #
                    "type": "Point",
                }
            }
        end
        midpoint_all = {"type": "FeatureCollection", "features":  midpoint_all_location}

        bundle << user
        bundle << target
        bundle << midpoint_all
        render :json => ActiveSupport::JSON.encode(bundle)
    end

    def event_remote
        redirect_to event_path(current_user.events.last.id)
    end

    private
    def event_params
        params.require(:event).permit(
          :user_id, 
          :midpoint_id, 
          :remark, 
          :event_date,
          :event_time,
        )
    end
end
