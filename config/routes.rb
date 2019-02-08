Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resource :session, controller: "clearance/sessions", only: [:create]

    resource :profiles, only: [:create, :new, :show]
    resource :maps, only: [:create, :new, :show]
    
    resources :users, only: [:create] do
        resource :event, only: [:new, :create]
        resource :password,
            controller: "clearance/passwords",
            only: [:create, :edit, :update]
    end
    
    resources :events, only: [:show]
    resources :events, only: [:show]
    resources :admin, only: [:index]
    resources :midpoints, only: [:create]

    get "/sign_in" => "clearance/sessions#new", as: "sign_in"
    delete "/sign_out" => "sessions#destroy", as: "sign_out"
    get "/sign_up" => "clearance/users#new", as: "sign_up"
    get "/auth/:provider/callback" => "sessions#create_from_omniauth"
    post "/event_map" => "events#event_map", as: "event_map"
    get "/event_detail/:id" => "events#detail", as: "event_detail"
    post "/event/:event_id/midpoint/:id" => "events#meetpoint", as:"set_meetpoint"
    get "/meeting" => "invites#new", as: "meeting"
    post "/meeting_map" => "invites#map", as: "meeting_map"
    get "/invites_detail/:id" => "invites#detail"

    post "/map" => "maps#map", as: "map"
    get "/show" => "welcomes#show", as: "show"
    post "/invite_colabs" => "invites#create_colabs", as: "invite_colabs"
    root 'welcomes#index'


	Clearance.configure do |config|
    	config.routes = false
    end

    get "/redirect" => "welcomes#redirect", as: "login_redirect"

end
