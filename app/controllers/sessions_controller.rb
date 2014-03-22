class SessionsController < ApplicationController
	def new
		#no initialization required
	end

	def index 
	end 

	def create 
		# get the user based on user email 
		@user = User.find_by_user_email(params[:user_email])

		# authenticate the user 
		if @user && @user.authenticate(params[:password])
			# set the session user_email
			session[:user_email] = @user.user_email

			# set the session log in time 
			session[:log_in_time] = Time.now

			# user#show
			redirect_to user_path(@user), notice: "Logged in!"
		else
			#back to home 
			redirect_to root_url, notice: "Fail - Not Logged In"
		end
	end

	def destroy
		@session =  Session.new(:user_id => current_user.id, 
								:log_in_time => session[:log_in_time],
								:log_out_time => Time.now)

		# log out either way
		# save session if possible 
		if @session.save		
			# no active user 
			session[:user_email] = nil 

			# back to home 
			redirect_to root_url, notice: "Session Saved - Logged Out!"
		else 
			# no active user 
			session[:user_email] = nil 

			# back to home 
			redirect_to root_url, notice: "Session Did Not Save - Logged Out!"
		end
	end

end
