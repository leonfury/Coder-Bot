Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resource :session, controller: "clearance/sessions", only: [:create]

    
    resources :users, only: [:create] do
        resource :event, only: [:new, :create]
        resource :password,
            controller: "clearance/passwords",
            only: [:create, :edit, :update]
    end
    
    resources :events, only: [:show]

    get "/sign_in" => "clearance/sessions#new", as: "sign_in"
    delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
    get "/sign_up" => "clearance/users#new", as: "sign_up"
    get "/auth/:provider/callback" => "sessions#create_from_omniauth"
    get "/event_remote" => "events#event_remote"

    post "/map" => "welcomes#map", as: "map"
    get "/show" => "welcomes#show", as: "show"
    post "/invite_colabs" => "invites#create_colabs", as: "invite_colabs"
    root 'welcomes#index'


	Clearance.configure do |config|
    	config.routes = false
    end

end
