class HotelsController < ApplicationController
    before_action :authorize_user
    private
    def authorize_user
        redirect_to root_path if !signed_in?
    end
end
