class HomeController < ApplicationController
  def index
    render "homepage/home/index"
  end

  def qr_code
    render "homepage/home/code"
  end

  def resume_code
    render "homepage/home/resume"
  end

  def resume_download
    send_file("#{Rails.root}/public/files/resume.pdf", filename: "resume.pdf", type: "application/pdf", disposition: "attachment")
  end
end
