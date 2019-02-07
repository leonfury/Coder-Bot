class UsersController <  Clearance::UsersController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        
        if user.save 
            p 'user info save'
            user.update(poi: "poi_#{user.id}")
            redirect_to map_path
        else
            p 'failed to save listing'
            p user.errors.full_messages
           redirect_to sign_up_path, notice: "Error signing up"
        end
        
    end

    private
    def user_params
        params.require(:user).permit(
          :first_name, 
          :last_name, 
          :email, 
          :password,
          :address, 
          :longtitude, 
          :latitude, 
          :poi
          )
    end
end

