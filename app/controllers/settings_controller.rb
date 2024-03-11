class SettingsController < ApplicationController
  def index
    if session[:user_id]
      render "mainpage/settings/index"
    else  
      redirect_to "/log_in"
    end  
  end
end
