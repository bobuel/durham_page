class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  helper_method :current_user

  private 

  	# return current user or nothing 
	def current_user
		@current_user ||= User.find_by_user_email(session[:user_email]) if session[:user_email]
	end
end
