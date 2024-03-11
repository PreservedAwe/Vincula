class ProfileController < ApplicationController
  def index
    if session[:user_id]
      render "mainpage/profile/index"
    else  
      redirect_to "/log_in"
    end  
  end
end
