class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:edit, :update, :show]
  before_action :require_admin, except: [:show, :index]
  
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    @category_goals = @category.goals.paginate(page: params[:page], per_page: 5)
    
  end
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
  
  end

  private

  def set_category
    @category = Category.find(params[:id])  
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "You have to be an admin to do that"
      redirect_to root_path
    end
  end  
end