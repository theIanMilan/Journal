class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.order('created_at DESC')
  end
  
  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    
    if @category.valid?
      flash[:notice] = "Category successfully created!"
      redirect_to categories_path
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def edit; end

 def update
   if @category.update(category_params)
     flash[:notice] = "Category successfully edited!"
     redirect_to categories_path
   else
     flash[:alert] = "Something went wrong..."
     render :new
   end
 end

  def destroy
    @category.destroy

    flash[:notice] =  "Article successfully deleted!"
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
