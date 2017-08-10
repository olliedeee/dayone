class UsersController < ApplicationController
  

  def new
    @user = User.new
  end
  
  def index
    @users = User.all  
  end
 
 def edit
  @user = User.find(params[:id])
 end
 
 def update
  @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully!"
      redirect_to @user
    else
      render 'edit'
    end
 end

def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.username} to Day One"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def show 
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
end