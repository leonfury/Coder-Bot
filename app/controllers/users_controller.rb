class UsersController < Clearance::UsersController
	# def new
	# 	@user = User.find_by(current_user.id)
	# end
	
	def create
		user = User.new(user_params)
		if user.save
			redirect_to sign_in_path
		else
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
			:user_type,
			:avatar
			)
	end
end


