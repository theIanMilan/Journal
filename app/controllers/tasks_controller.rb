class TasksController < ApplicationController
    def index
    end 

    def new
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.build
    end
    
    def create
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.build(task_params)
        
        if @task.save
            flash.notice = "Success: Task added!"
            redirect_to category_path(@category)
        else
            flash.alert = "Failed: Error in adding task!"
        end
    end

    def edit      
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])
    end

    def update
        @category = current_user.categories.find(params[:category_id])
        @task = @category.tasks.find(params[:id])

        if @task.update(task_params)
            flash.notice = "Success: Task updated!"
            redirect_to category_path(@category)
        else
            flash.alert = "Failed: Error in updating task!"
        end
    end

    private
    def task_params
      params.require(:task).permit(:title, :description)
    end
end
