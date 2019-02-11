class InvitesController < ApplicationController

    def create_colabs
        colabs = params[:colaborators]
        colabs.each do |u|
            Invite.create(
                event_id: params[:event_id], 
                user_id: u,
            )
        end
    end

    def new
        @invites = current_user.invites
    end

    def detail
        @event = Event.find(params[:id])

        respond_to do |format|
            format.js
        end
    end

    def show
        @event = Event.find(params[:event_id])
        limit = params[:dist].to_f * 0.009
        lng_min = @event.midpoint.longtitude.to_f - limit
        lng_max = @event.midpoint.longtitude.to_f + limit
        lat_min = @event.midpoint.latitude.to_f - limit
        lat_max = @event.midpoint.latitude.to_f + limit

        show_hotel, bundle = [], []

        @hotels = Hotel.all
        @hotels.each do |h|
            if ((lng_min < h.longtitude.to_f) &&  (h.longtitude.to_f < lng_max) && (lat_min < h.latitude.to_f) &&  (h.latitude.to_f< lat_max))
                show_hotel << {
                    "type": "Feature",
                    "revelance": 1,
                    "properties": {
                        "description": "<img src='https://i.ibb.co/yPYz8x4/ruby-pin.gif' height='142' width='100' class='d-none'> 
                        <br> #{h.hotel_name} 
                        <br> Coordinates: #{h.longtitude}, #{h.latitude} 
                        <br> Star: <span>#{h.star}</span>
                        <br> Price: <span>#{h.price}</span>
                        <br> City: <span>#{h.city}</span>
                        <br> Address: <span>#{h.address}</span>",
                        "landmark": true,
                        "category": "building",
                        "iconSize": [60, 60],
                    },
                    "center": [h.longtitude, h.latitude],
                    "geometry":{
                        "coordinates": [h.longtitude, h.latitude],
                        "type": "Point"
                }

            }
            end

        end

        hotel = {"type": "FeatureCollection", "features":  show_hotel}
        bundle  << hotel
        render :json => ActiveSupport::JSON.encode(bundle)
    end

    def map
        @hotels = Hotel.all
        bundle, hotel_kl = [], []
        @hotels.each do |h|
            hotel_kl << {
                "type": "Feature",
                "revelance": 1,
                "properties": {
                    "description": "<img src='https://i.ibb.co/yPYz8x4/ruby-pin.gif' height='142' width='100' class='d-none'> 
                    <br> #{h.hotel_name} 
                    <br> Coordinates: #{h.longtitude}, #{h.latitude} 
                    <br> Star: #<span>#{h.star}</span>
                    <br> Price: #<span>#{h.price}</span>
                    <br> City: #<span>#{h.city}</span>
                    <br> Address: #<span>#{h.address}</span>",
                "landmark": true,
                "category": "building",
                "iconSize": [60, 60],
                },
                "center": [h.longtitude, h.latitude],
                "geometry":{
                    "coordinates": [h.longtitude, h.latitude],
                    "type": "Point"
                }
            }
        end
        hotel = {"type": "FeatureCollection", "features":  hotel_kl}
        bundle  << hotel
        render :json => ActiveSupport::JSON.encode(bundle)
    end
    
end
