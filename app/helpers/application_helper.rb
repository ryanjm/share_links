module ApplicationHelper
  def simple_time(time)
    # 3:45pm Tue, Jan 3
    time.strftime("%l:%M%P %a, %b %-d")
  end
end
