class RegisterController < ApplicationController
  def index
    if session[:user_id]
      redirect_to "/menu"
    else  
      render "homepage/register/index"
    end  
  end

  def is_valid
    userByEmail = User.find_by(email: params[:email])
    userByUsername = User.find_by(username: params[:username])

    if !userByUsername && !userByEmail && params[:password] == params[:confirmPassword]
      user = User.create!(email: params[:email], password: params[:password], username: params[:username])
      userSettings = user.create_setting(user: user)
      session[:user_id] = user.id
      session[:r_email] = nil
      session[:r_username] = nil
      redirect_to "/menu" 
    else  
      session[:r_email] = params[:email]
      session[:r_username] = params[:username]
      if userByEmail    
        redirect_to "/register", notice: "There is a user with that email already"  
      elsif userByUsername
        redirect_to "/register", notice: "There is a user with that username already" 
      else
        redirect_to "/register", notice: "The Passwords do not match" 
      end
    end
  end  
end
