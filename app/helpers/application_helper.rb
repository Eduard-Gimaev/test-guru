module ApplicationHelper
  def current_year
    " - #{Time.now.year.to_i} - "
  end

  def flash_message
    flash.map do |type, msg|
      content_tag :p, flash[type], class: "flash #{type}"
    end.join().html_safe
  end

end


