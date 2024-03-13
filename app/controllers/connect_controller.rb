class ConnectController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      @searched_users = User.where(username: 'testy1')
      render "mainpage/connect/index"
    else  
      redirect_to "/log_in"
    end  
  end
end
