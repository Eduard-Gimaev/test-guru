module ApplicationHelper
  def current_year
    " - #{Time.now.year.to_i} - "
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "flash #{type}"
  end

end


