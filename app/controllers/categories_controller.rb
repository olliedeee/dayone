class CategoriesController < ApplicationController
  
  before_action :set_category, only: [:edit, :update, :show]

  
  def new
    @category = Category.new
    authorize @category
  end
  
  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end
  
  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      flash[:success] = "Category successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    @category_goals = @category.goals
    
  end
  
  def index
    @categories = Category.all
  end
  
  def destroy
    authorize @category
  end

  private

  def set_category
    @category = Category.find(params[:id])  
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
  

end