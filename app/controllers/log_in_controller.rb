class LogInController < ApplicationController
  def index
    if session[:user_id]
      redirect_to "/menu"
    else  
      render "homepage/log_in/index"
    end  
  end  

  def is_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/menu"  
    else  
    end  
  end  

end
