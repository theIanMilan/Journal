class TasksController < ApplicationController
  before_action :set_category, only: %i[show new create edit update destroy]

  def index; end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      flash.notice = 'Success: Task added!'
      redirect_to category_path(@category)
    else
      flash.alert = 'Failed: Error in adding task!'
    end
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      flash.notice = 'Success: Task updated!'
      redirect_to category_path(@category)
    else
      flash.alert = 'Failed: Error in updating task!'
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy

    flash[:notice] = 'Task successfully deleted!'
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed, :deadline)
  end
end
