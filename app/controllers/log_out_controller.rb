class LogOutController < ApplicationController
  def index
    if session[:user_id]
      session[:user_id] = nil  
      redirect_to "/", notice: "Logged out"
    else  
      redirect_to "/"
    end  
  end
end
