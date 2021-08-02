class TasksController < ApplicationController
    def index
        @tasks = Task.order('created_at DESC')
      end
    
    def new
        @task = Task.new
    end
end