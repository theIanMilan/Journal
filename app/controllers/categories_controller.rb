class CategoriesController < ApplicationController
  def index
    @category = Category.order('created_at DESC')
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
 end

 def update
   @category = Category.find(params[:id])

   if @category.update(category_params)
     flash[:notice] = "category successfully edited!"
     redirect_to categories_path
   else
     flash[:alert] = "Something went wrong..."
     render :new
   end
 end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
