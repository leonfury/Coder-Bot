class ProfilesController < ApplicationController
    before_action :authorize_user
	def show
		@user = User.find(current_user.id)
    end
    private
    def authorize_user
        redirect_to root_path if !signed_in?
    end
end