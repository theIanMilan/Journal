# shorthand of an empty method = def index; end

class TasksController < ApplicationController
    def index
        # @category = Category.find(params[:category_id])

        # @tasks = @category.tasks
        # @tasks = Task.order('created_at DESC')
    end 

    def new
        @category = Category.find(params[:category_id])

        @task = @category.tasks.build
        # knows what category id
        # creating a tasks (through new.html.erb) under category id
    end
    
    def create
        @category = Category.find(params[:category_id])
        # to target specific category, use "category_id" from schema.rb - edit
        @task = @category.tasks.build(task_params)

        # @task = @category.tasks.create(params[:task_params])
        
        if @task.save
            flash.alert = "Success: Task created!"
            redirect_to category_path(@category)
        else
            flash.alert = "Failed: Error in creating task!"
        end
    end

    # def show; end

    # def edit; end

    # def update; end

    # def destroy; end

    # What is a private method in Ruby?
    # It's a type of method that you can ONLY call from inside the class where it's defined.
    # This allows you to control access to your methods.
    # allowed to be stored in the database
    private
    def task_params
      params.require(:task).permit(:title, :description)
    end
end