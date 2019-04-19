class TasksController < ApplicationController
  def index
    # TODO: get current user
    @current_user = User.find_by(id: 1)

    @new_task = @current_user.tasks.build
    @tasks = Task.where(user: @current_user)
  end

  def show
    @task = Task.find(params[:id])
  end
end
