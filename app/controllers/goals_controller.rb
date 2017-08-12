class GoalsController < ApplicationController
  
  before_action :set_goal, only: [:edit, :update, :show,  :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    #@goals = Goal.all
    @goals = Goal.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @goal = Goal.new
  end
  
  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      flash[:success] = "Goal was created successfully"
      redirect_to goal_path(@goal)
    else
      render 'new'
    end
  end
  
  def edit
  end

  def destroy
    @goal.destroy
    flash[:success] = "Goal successfully deleted!"
    redirect_to goals_path
  end
  
  def update
       if @goal.update(goal_params)
        flash[:success] = "Goal updated successfully!"
        redirect_to goal_path(@goal)
       else
        render 'edit'
       end
  end
  
  def show
    @comment = Comment.new
    @comments = @goal.comments.paginate(page: params[:page], per_page: 3)
  end
  
private
  def goal_params
    params.require(:goal).permit(:name, :description, category_ids: [])
  end
  
  def set_goal
   @goal = Goal.find(params[:id])
  end
 
   def require_same_user
     if current_user != @goal.user and !current_user.admin?
       flash[:danger] = "You can only edit or delete your own goals"
       redirect_to goals_path
     end
   end
end