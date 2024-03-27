class LogOutController < ApplicationController
  def index
    if session[:user_id]
      session[:user_id] = nil 
      cookies.encrypted[:user_id] = nil 
      redirect_to "/"
    else  
      redirect_to "/"
    end  
  end
end
