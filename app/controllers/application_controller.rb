class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  include DeviseWhitelist
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private
    def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
    end
    
end
