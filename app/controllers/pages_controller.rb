class PagesController < ApplicationController
  
def home
  redirect_to goals_path if user_signed_in?
end
  
end