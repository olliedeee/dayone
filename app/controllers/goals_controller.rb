class GoalsController < ApplicationController
  
  def index
    @goals = Goal.all
  end
  
  def new
    @goal = Goal.new
  end
  
  def create
    @goal = Goal.new(goal_params)
    @goal.user = User.first
    if @goal.save
      flash[:success] = "Goal was created successfuly"
      redirect_to goal_path(@goal)
    else
      render 'new'
    end
  end
  
  
  def show
    @goal = Goal.find(params[:id])
  end
  
  
  private
  def goal_params
    params.require(:goal).permit(:name, :description)
  end
 
  
end