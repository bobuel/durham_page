class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  helper_method :current_user
  helper_method :validate_admin

  private 

  	# return current user or nothing 
	def current_user
		@current_user ||= User.find_by_user_email(session[:user_email]) if session[:user_email]
	end

	def validate_admin
		@current_user = current_user 
		if @current_user.is_admin
			# we good
		else 
			redirect_to root_path, notice: "Access Denied" 
		end
	end

	def validate_user(object)
		redirect_to root_path, notice: "Access Denied" unless object.user_id == current_user.id
	end 

	def validate_admin_bln
		@current_user = current_user 
		if @current_user.is_admin
			true
		else 
			false
		end
	end

	def validate_user_bln(object)
		if object.user_id == current_user.id
			true
		else
			false
		end
	end 


end
