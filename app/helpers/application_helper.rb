module ApplicationHelper
  def fading_flash_notice
    # note: you must have a div with id='notices' or rename the div appended to below with your element which
    # is the container for the flash messages

    return '' unless flash[:notice]

    notice_id = rand.to_s.gsub(/\./, '')
    notice = <<-EOF
      $('.alert').fadeOut(3000);
    EOF
    notice.html_safe
  end
end
