class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def help
  end

  def download_xlsb
    send_file "#{Rails.root}/public/downloads/PERSONAL.xlsb", x_sendfile: true
  end

  def download_dotm
    send_file "#{Rails.root}/public/downloads/Normal.dotm", x_sendfile: true
  end

  def download_ppam
    send_file "#{Rails.root}/public/downloads/RA_macros.ppam", x_sendfile: true
  end
end
