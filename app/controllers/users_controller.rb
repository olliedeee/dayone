class UsersController < ApplicationController
  
   before_action :set_user, only: [:edit, :update, :show, :destroy]
   before action :require_same_user, only: [:edit, :update, :destroy]
   
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
 
 def edit
 end
 
 def update
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
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username} to Day One"
      redirect_to user_path(@user)
    else
      render 'new'
    end
   end
  
  def show 
  end
  
  def destroy
    @user.destroy
    flash[:danger] = "User and all their related goals have been deleted"
    redirect_to users_path
  end

  
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit or delete your own account"
      redirect_to users_path
    end
  end
  
end