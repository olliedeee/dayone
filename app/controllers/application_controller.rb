class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include DeviseWhitelist
  
  
  # helper_method :current_user, :logged_in?
  
  
  # def current_user - *** Replaced by DEVISE:current_user   *** 
  #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end 
  
  # def logged_in? *** Replaced by DEVISE: user_signed_in? ***
  #   !!current_user  
  # end
  
  # def require_user
  #   if !logged_in?
  #       flash[:danger] = "You must be logged in to perform that action" 
  #       redirect_to root_path
  #   end
  # end
  
  # DEVISE: user_session
end
