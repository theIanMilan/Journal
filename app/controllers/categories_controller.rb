class CategoriesController < ApplicationController
  def index
    @categories = Category.order('created_at DESC')
  end
  
  def show
    @category = Category.find(params[:id])
  end

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

  def edit
    @category = Category.find(params[:id])
 end

 def update
   @category = Category.find(params[:id])

   if @category.update(category_params)
     flash[:notice] = "Category successfully edited!"
     redirect_to categories_path
   else
     flash[:alert] = "Something went wrong..."
     render :new
   end
 end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash[:notice] =  "Article successfully deleted!"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
