class MapsController < ApplicationController

    def show
        @users = User.all
        @event = Event.first ######################################################### TO FIX
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
    
    def map #main map displays all users
        @users = User.all
        bundle, user_ruby, user_python, user_js, user_css = [], [], [], [], []
        @users.where(lang: 'ruby').each do |u|
            user_ruby << {
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "description": "<img src='https://i.ibb.co/yPYz8x4/ruby-pin.gif' height='142' width='100' class='d-none'> 
                        <br><span class='username'>#{u.username} </span>
                        <br> Language: <span class='user_lang'> #{u.lang} </span>
                        <br> <span class='d-none'>User ID: #<span class='user_id'>#{u.id}</span></span>
                        <br><button id='#{u.id}' class='colab-btn btn btn-primary'>Collaborate!</button>", #
                    "landmark": true,
                    "category": "college, university, building",
                    "iconSize": [60, 60],
                    "lang": "#{u.lang}",
                    "poi": "#{u.poi}",
                },
                "center": [u.longtitude, u.latitude], #
                "geometry": {
                    "coordinates": [u.longtitude, u.latitude], #
                    "type": "Point"
                }
            }
        end
        ruby = {"type": "FeatureCollection", "features":  user_ruby}
        
        @users.where(lang: 'python').each do |u|
            user_python << {
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "description": "<img src='https://i.ibb.co/yPYz8x4/ruby-pin.gif' height='142' width='100' class='d-none'> 
                        <br><span class='username'>#{u.username} </span>
                        <br> Language: <span class='user_lang'> #{u.lang} </span>
                        <br> <span class='d-none'>User ID: #<span class='user_id'>#{u.id}</span></span>
                        <br><button id='#{u.id}' class='colab-btn btn btn-primary'>Collaborate!</button>", #
                    "landmark": true,
                    "category": "college, university, building",
                    "iconSize": [60, 60],
                    "lang": "#{u.lang}",
                    "poi": "#{u.poi}",
                },
                "center": [u.longtitude, u.latitude], #
                "geometry": {
                    "coordinates": [u.longtitude, u.latitude], #
                    "type": "Point"
                }
            }
        end
        python = {"type": "FeatureCollection", "features":  user_python}
        
        @users.where(lang: 'javascript').each do |u|
            user_js << {
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "description": "<img src='https://i.ibb.co/yPYz8x4/ruby-pin.gif' height='142' width='100' class='d-none'> 
                        <br><span class='username'>#{u.username} </span>
                        <br> Language: <span class='user_lang'> #{u.lang} </span>
                        <br> <span class='d-none'>User ID: #<span class='user_id'>#{u.id}</span></span>
                        <br><button id='#{u.id}' class='colab-btn btn btn-primary'>Collaborate!</button>", #
                    "landmark": true,
                    "poi": "#{u.poi}",
                    "category": "college, university, building",
                    "iconSize": [60, 60],
                    "lang": "#{u.lang}",
                    
                },
                "center": [u.longtitude, u.latitude], #
                "geometry": {
                    "coordinates": [u.longtitude, u.latitude], #
                    "type": "Point"
                }
            }
        end
        js = {"type": "FeatureCollection", "features":  user_js}
        
        @users.where(lang: 'css').each do |u|
            user_css << {
                "type": "Feature",
                "relevance": 1,
                "properties": {
                    "description": "<img src='https://i.ibb.co/yPYz8x4/ruby-pin.gif' height='142' width='100' class='d-none'> 
                        <br><span class='username'>#{u.username} </span>
                        <br> Language: <span class='user_lang'> #{u.lang} </span>
                        <br> <span class='d-none'>User ID: #<span class='user_id'>#{u.id}</span></span>
                        <br><button id='#{u.id}' class='colab-btn btn btn-primary'>Collaborate!</button>", #
                    "landmark": true,
                    "category": "college, university, building",
                    "iconSize": [60, 60],
                    "lang": "#{u.lang}",
                    "poi": "#{u.poi}",
                },
                "center": [u.longtitude, u.latitude], #
                "geometry": {
                    "coordinates": [u.longtitude, u.latitude], #
                    "type": "Point"
                }
            }
        end
        css = {"type": "FeatureCollection", "features":  user_css}
        
        bundle << ruby
        bundle << python
        bundle << js
        bundle << css
        render :json => ActiveSupport::JSON.encode(bundle)
    end

    def redirect
    end
end