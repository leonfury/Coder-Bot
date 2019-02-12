class InvitesController < ApplicationController
    before_action :authorize_user

    def create_colabs
        colabs = params[:colaborators]
        colabs.each do |u|
            Invite.create(
                event_id: params[:event_id], 
                user_id: u,
            )
        end

        if Event.find(params[:event_id]).invites.where(user_id: current_user.id).count == 0
            Invite.create(
                event_id: params[:event_id], 
                user_id: current_user.id,
            )
        end
    end

    def new
        @invites = current_user.invites
    end

    def invite_event
        show_invite, bundle = [], []
        current_user.invites.each do |i|            
            show_invite << {
                "type": "Feature",
                "revelance": 1,
                "properties": {
                    "description": "<div><img src='#{}' height='400' width='400' style='background-size: cover; background-position: 50% 50%;'>
                        <br> <h4 class='username-text'> #{i.event.midpoint.name}  </h4>",
                    "landmark": true,
                    "category": "building",
                    "iconSize": [60, 60],
                    "coordinates": [i.event.midpoint.longtitude, i.event.midpoint.latitude] 
                },
                "center": [i.event.midpoint.longtitude, i.event.midpoint.latitude],
                "geometry":{
                    "coordinates": [i.event.midpoint.longtitude, i.event.midpoint.latitude],
                    "type": "Point"
            }
        }
        
        end
        invite = {"type": "FeatureCollection", "features":  show_invite}
        bundle  << invite
        render :json => ActiveSupport::JSON.encode(bundle)
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

        img_src = [
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_1-0b8cede2f5414e0429b6fdaa2a32930e130aadd0bb7529c0f9b8118217c0e911.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_2-291848ce283bc205838c0b97182ba83489fbac692d323875b4cac9ccc79ddbbb.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_3-3c11444d08e4346689008b84001aad8c6160405dd3e4a998d39b3a9073be9675.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_4-57c8f33dd0914a9f5011da45ae3b1ff4dcdba5cc696a3a209d517363cdae70d6.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_5-c711f4fe313c424958b177e178e8b6a95006d77ecf7e9738749023ccf2ff01e2.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_6-f25a3d9ee1fc151c727d227fd7ef11941f608e2e7300940097c3837323c93a55.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_7-ee51394201a17e2072b9c41966653f303a9e6ef7e0436425187f0bef85afef43.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_8-8b67c43463abce0b579b2a517878e0d57eec5fe7dfeeb9d9f7e7e387e8341729.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_9-8b57a977bf3d9f9ff2071a1aa022ed3928534884554b93620ff0d16b8c3537fc.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_10-3872ff7dada6ece0e7b089b4e9015a6dd013e8bbebd9f6ea01cbc4ddfdb35b62.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_11-d36c3c6f31661ee30d85678d91673caa3daea03e6293cbc61446a0e780b508b0.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_12-548cf30099754332e4769dd8cdbfdbc2e87cdd3aa941c0170e9f70934148def3.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_13-c4e0c18f34865bc0763aca787c55574469a24e7540651f5c79da73ac2142d015.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_14-2eed5cf0164bd7b44950ebe86fa5209d090ab092899cea877388f5ad1e4e10af.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_15-e924f73c325d1b54932de227d4ea9e7631de1771a6c4e2bcc2b2af7b8f6c1a98.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_16-8e470e6aea0a4a57093d0513dd3b7a59c1b2d24002db9471e493a5ca971c27f8.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_17-4b5f2a75e7c137ccb78c496743be87a36b01b614ce957f36782ed5f0b71ec0bb.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_18-273925a5a51489363f2fe8fd06d7757a63668f0d379d9b485ea85b0b4808af91.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_19-8aad079a90c287fc32261b59c6c60f96ec5746ca7a3b3461fb2a8550815c33ca.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_20-a408867b311ad0645fadfbf8e3dab753ff14e71f01e90901ff2caf5cd496345b.jpg",
            "https://next-academy-group-1-coder-bot.herokuapp.com/assets/hotels/hotel_21-5f0cd78cb8cf93102425e07a90e0aa60c3587bb8b2f4c46ad22df27a275cfcc3.jpg"
        ]

        @hotels = Hotel.all
        @hotels.each do |h| 
            stars = 0
            stars = "⭐️" if h.star == "1"
            stars = "⭐️⭐️" if  h.star == "2"
            stars = "⭐️⭐️⭐️" if h.star == "3"
            stars = "⭐️⭐️⭐️⭐️" if h.star == "4"
            stars = "⭐️⭐️⭐️⭐️⭐️" if h.star == "5" 

            if ((lng_min < h.longtitude.to_f) &&  (h.longtitude.to_f < lng_max) && (lat_min < h.latitude.to_f) &&  (h.latitude.to_f< lat_max))
                show_hotel << {
                    "type": "Feature",
                    "revelance": 1,
                    "properties": {
                        "description": "<div><img src='#{img_src.sample}' height='400' width='400' style='background-size: cover; background-position: 50% 50%;'>
                            <br> <h4 class='username-text'> #{h.hotel_name}  </h4>
                            
                            <br><span style='font-size:30px; line-height:1.2;'>#{stars}</span> 
                            <br> Price: <strong>RM <span>#{h.price}</span>/night</strong>
                            <br> City: <strong><span>#{h.city}</span></strong>
                            <br> Address: <strong><span>#{h.address}</span></strong><div>",
                        "landmark": true,
                        "category": "building",
                        "iconSize": [60, 60],
                        "coordinates": [h.longtitude, h.latitude] 
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
    

    private
    def authorize_user
        redirect_to root_path if !signed_in?
    end
end
