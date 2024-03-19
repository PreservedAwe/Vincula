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
      if user
        redirect_to "/log_in", alert: "The password isn't correct, try again"   
      else 
        redirect_to "/log_in", notice: "User isn't in our database"
      end
    end  
  end  

end
