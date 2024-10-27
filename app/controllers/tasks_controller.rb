# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :update, :destroy, :complete]
  
    def create
      @category = Category.find(params[:category_id])
      @task = @category.tasks.build(task_params)
      if @task.save
        redirect_to category_path(@category), notice: 'Task was successfully created.'
      else
        redirect_to category_path(@category), alert: 'Error creating task.'
      end
    end
  
    def edit; end
  
    def update
      if @task.update(task_params)
        redirect_to category_path(@task.category), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to category_path(@task.category), notice: 'Task was successfully deleted.'
    end
  
    def complete
      @task.update(status: 'complete')
      redirect_to category_path(@task.category), notice: 'Task marked as complete.'
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :category_id)
    end
  end
  