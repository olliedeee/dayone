class PagesController < ApplicationController
  
def home
  redirect_to goals_path if logged_in?
end
  
end