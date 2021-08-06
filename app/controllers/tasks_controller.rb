# shorthand of an empty method = def index; end

class TasksController < ApplicationController
    def index
    end 

    def new
        @category = Category.find(params[:category_id])

        @task = @category.tasks.build
        # knows what category id
        # creating a tasks (through new.html.erb) under category id
    end
    
    def create
        @category = Category.find(params[:category_id])
        @task = @category.tasks.build(task_params)
        
        if @task.save
            flash.alert = "Success: Task created!"
            redirect_to category_path(@category)
        else
            flash.alert = "Failed: Error in creating task!"
        end
    end
    
    private
    def task_params
      params.require(:task).permit(:title, :description)
    end
end
