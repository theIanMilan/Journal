class TasksController < ApplicationController
    def index
    end 

    def new
        @category = Category.find(params[:category_id])

        @task = @category.tasks.build
    end
    
    def create
        @category = Category.find(params[:category_id])
        @task = @category.tasks.build(task_params)
        
        if @task.save
            flash.alert = "Success: Task added!"
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