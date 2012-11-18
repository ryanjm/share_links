module ApplicationHelper
  
  # Method to format time.
  def simple_time(time)
    # 3:45pm Tue, Jan 3
    time.strftime("%l:%M%P %a, %b %-d")
  end
  
  # Present errors for a form
  def show_errors(obj)
    return_string = "<div class='errors'><p>There were some errors:</p><ul>"
    obj.errors.each do |key, value|
     return_string += "<li>#{key.capitalize} #{value}</li>"
    end
    return_string += "</ul></div>"
    return_string.html_safe
  end
end
