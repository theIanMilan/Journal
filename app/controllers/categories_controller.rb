class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @user = current_user
    @categories = @user.categories.all.with_rich_text_description.order('created_at DESC')
  end

  def show
    @tasks = @category.tasks.all.with_rich_text_description.order('deadline ASC')

    @tasks_today = @tasks.where(deadline: Date.today.all_day)
    @tasks_others = @tasks.where.not(deadline: Date.today.all_day)

    @total_tasks = @tasks.count
    @completed_tasks = @tasks.where(completed: true).count
    @percent_complete = (@completed_tasks.to_f / @total_tasks * 100).round(2)
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.build(category_params)
    @category.save!
    
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

    flash[:notice] =  "Category successfully deleted!"
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
