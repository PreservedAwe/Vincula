class MessagesController < ApplicationController
  def index
    if session[:user_id]
      render "mainpage/messages/index"
    else  
      redirect_to "/log_in"
    end  
  end
end
