class WelcomesController < ApplicationController
    before_action :authorize_user

    def index
    end

    private
    def authorize_user
        redirect_to maps_path if signed_in?
    end
end
