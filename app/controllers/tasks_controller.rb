class TasksController < ApplicationController
  def index
    @tasks = Task.where(user: current_user).order(deadline: :asc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @current_user = current_user
    @new_task = current_user.tasks.build
  end

  def edit
    @current_user = current_user
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = "Task added"
      redirect_to @task
    else
      # TODO: Provide constructive errors (based on validation)
      flash.now[:error] = "Error creating task"
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      flash[:success] = "Task updated"
      redirect_to @task
    else
      # TODO: Provide constructive errors (based on validation)
      flash.now[:error] = "Error editing task"
      render 'edit'
    end
  end

  def destroy
    deleted_task = Task.find(params[:id]).destroy

    if deleted_task.destroyed?
      flash[:success] = "Task deleted"
      redirect_to root_url
    else
      flash.now[:error] = "Error deleting task"
      render 'edit'
    end
  end

  # private methods
  private

  def task_params
    params.require(:task).permit(:name, :description, :deadline,
                                 :priority, :status, tag_ids: [])
  end

  # TODO: get current user
  # I haven't implemented users yet, so this is just a stub
  def current_user
    User.find_by(id: 1)
  end
end
