class EventsController < ApplicationController
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
        redirect_to root_path
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

    def event_map
        bundle, user_location, target_location = [], [], []
        Event.find(params[:event_id]).invites.each do |i|
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
        
        Midpoint.all.each do |p|
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
        bundle << user
        bundle << target
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
