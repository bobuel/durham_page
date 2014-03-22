class UsersController < ApplicationController
	before_filter :validate_user, only: [:edit, :update, :destroy] 
	before_filter :check_exists, only: [:create]

	def index 
		# send to login page 
		redirect_to root_url
	end

	def new 
		@user = User.new
	end 

	def edit 
		@user = User.find(params[:id])
	end

	def create 
		@user = User.new(user_params)

		if @user.save 
			session[:user_email] = @user.user_email
			redirect_to user_path(@user)
		else 
			redirect_to 'new'
		end
	end 

	def show 
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to root_url, notice: "User is No Longer"
	end

	private 
		def user_params 
			# whitelist password and password_confirmation, keep has hand salt safe 
			params.require(:user).permit(:user_email, :user_first_name, :user_last_name, :password, :password_confirmation)
		end

		# validate current_user 
		def validate_user
			@user = User.find(params[:id])
			if @user == current_user
				# we good
			else
				redirect_to root_url
			end
		end

		def check_exists
			if User.exists?(user_email: params[:user][:user_email])
				redirect_to log_in_path, notice: "Already Have Account - Log In"
			else
				# n/a
			end
		end
end
