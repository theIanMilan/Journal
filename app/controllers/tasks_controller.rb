class TasksController < ApplicationController
    def index
    end 

    def new
        @user = current_user
        @category = @user.categories.find(params[:category_id])

        @task = @category.tasks.build
    end
    
    def create
        @user = current_user
        @category = @user.categories.find(params[:category_id])
        @task = @category.tasks.build(task_params)
        
        if @task.save
            flash.notice = "Success: Task added!"
            redirect_to category_path(@category)
        else
            flash.alert = "Failed: Error in adding task!"
        end
    end

    private
    def task_params
      params.require(:task).permit(:title, :description)
    end
end