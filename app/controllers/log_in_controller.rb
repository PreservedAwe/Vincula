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
      session[:login_email] = nil
      redirect_to "/menu"  
    else
      session[:login_email] = params[:email]
      if user
        flash[:notice] = "The password isn't correct, try again"
        redirect_to "/log_in"  
      else 
        flash[:error] = "User isn't in our database"
        redirect_to "/log_in"
      end
    end  
  end  

end
