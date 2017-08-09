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
      flash[:success] = "Goal was created successfully"
      redirect_to goal_path(@goal)
    else
      render 'new'
    end
  end
  
  
  def show
    @goal = Goal.find(params[:id])
  end
  
  def edit
   @goal = Goal.find(params[:id])
  end

def destroy
  Goal.find(params[:id]).destroy
  flash[:success] = "Goal successfully deleted!"
  redirect_to goals_path
end
  
  def update
       @goal = Goal.find(params[:id])
       if @goal.update(goal_params)
        flash[:success] = "Goal updated successfully!"
        redirect_to goal_path(@goal)
       else
        render 'edit'
      end
  end
  
  
  private
  def goal_params
    params.require(:goal).permit(:name, :description)
  end
 
  
end