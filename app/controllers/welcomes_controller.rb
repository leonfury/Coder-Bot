class WelcomesController < ApplicationController
    def index
        longtitude_tot = User.maximum(:longtitude).to_f + User.minimum(:longtitude).to_f
        latitude_tot = User.maximum(:latitude).to_f + User.minimum(:latitude).to_f
        longtitude_dif = User.maximum(:longtitude).to_f - User.minimum(:longtitude).to_f
        latitude_dif = User.maximum(:latitude).to_f - User.minimum(:latitude).to_f
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
    
    def map
        bundle, user_location, target_location = [], [], []
        User.all.each do |p|
            user_location << {
                "id": "poi.1580547980092", #get from database
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "description": "#{p.username} \n #{p.longtitude}, #{p.latitude}", #
                    "landmark": true,
                    "category": "college, university, building"
                },
                "text": "Next Academy",
                "place_name": "Next Academy, Kuala Lumpur, 60000, Malaysia",
                "center": [p.longtitude, p.latitude], #
                "geometry": {
                    "coordinates": [p.longtitude, p.latitude], #
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
        # push json into variable
        bundle << user
        bundle << target
        # pass variable back to front end
        render :json => ActiveSupport::JSON.encode(bundle)
    end
end
