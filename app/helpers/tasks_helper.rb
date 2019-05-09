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

  ##
  # Returns the Bootstrap badge class for a given status type
  def priority_badge_class(type)
    case type
    when "high" then "badge badge-danger"
    when "medium" then "badge badge-primary"
    when "low" then "badge badge-success"
    end
  end

  ##
  # Returns the Bootstrap badge class for a tag
  def tag_badge_class
    "badge badge-warning"
  end
end
