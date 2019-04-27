module TasksHelper
  ##
  # Returns the Font Awesome icon name for the task's status
  def status_icon(task)
    if task.started?
      "dot-circle"
    elsif task.complete?
      "check-circle"
    else
      "circle"
    end
  end
end
