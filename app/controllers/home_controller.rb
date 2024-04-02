class HomeController < ApplicationController
  def index
    render "homepage/home/index"
  end

  def qr_code
    render "homepage/home/code"
  end
end
