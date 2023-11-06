module ApplicationHelper
  def current_year
    " - #{Time.now.year.to_i} - "
  end

  def flash_message
    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}" if message.present?  
    end.join().html_safe
  end

end


