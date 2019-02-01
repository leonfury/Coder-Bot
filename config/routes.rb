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
    
    

    get "/sign_in" => "clearance/sessions#new", as: "sign_in"
    delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
    get "/sign_up" => "clearance/users#new", as: "sign_up"
    get "/auth/:provider/callback" => "sessions#create_from_omniauth"
    

    post "/map" => "maps#map", as: "map"
    get "/show" => "welcomes#show", as: "show"
    root 'welcomes#index'


	Clearance.configure do |config|
    	config.routes = false
    end

    get "/redirect" => "welcomes#redirect", as: "login_redirect"

end
