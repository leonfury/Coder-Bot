class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)

        if user.save 
            p 'user info save'
        else
            p 'failed to save listing'
            redirect_to new_user_path
        end
    end

    def user_params
        params.require(:user).permit(:fname, :lname, :email, :address, :longtitude, :latitude, :poi)
    end

end
