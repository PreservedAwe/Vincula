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

    if !User.exists?(email: params[:email]) && !User.exists?(username: params[:username]) && params[:password] == params[:confirmPassword]
      create_user
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

  def create_user
    user = User.create!(email: params[:email], password: params[:password], username: params[:username])
    user.profile_picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-user.png')), filename: 'default-user.png', content_type: 'image/png')
    user.ip_address = request.remote_ip
    user.save
    userSettings = user.create_setting(user: user)  
    userSettings.save  
  end
end
