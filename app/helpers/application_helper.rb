module ApplicationHelper
  ##
  # Returns the Bootstrap 4 class for a given flash key
  def flash_class(flash_key)
    base_class = "alert alert-dismissible fade show text-center"
    case flash_key
    when "success"
      base_class << " alert-success"
    when "alert"
      base_class << " alert-warn"
    when "notice"
      base_class << " alert-info"
    when "error"
      base_class << " alert-danger"
    end
  end
end
