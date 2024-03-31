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
      cookies.encrypted[:user_id] = session[:user_id]
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
    if user.ip_address == "127.0.0.1"
      user.ip_address = "205.211.157.84"
    elsif user.ip_address == nil
      user.ip_address = "142.181.120.13"
    else
    end
    userSettings = user.create_setting(user: user)  
    chosen_artists = [
      { user: user, order: 1 },
      { user: user, order: 2 },
      { user: user, order: 3 }
    ]
    chosen_artists = ChosenArtist.create!(chosen_artists) 
    chosen_genres = [
      { user: user, order: 1 },
      { user: user, order: 2 },
      { user: user, order: 3 }
    ]
    chosen_genres = ChosenGenre.create!(chosen_genres) 
    chosen_tag = [
      { user: user, order: 1 }
    ]
    chosen_tag = ChosenTag.create!(chosen_tag)  
    userSettings.search_type = 1
    userSettings.is_enabled = false   
    userSettings.max_distance = 50    
    userSettings.save     
    user.save   
    session[:user_id] = user.id
  end
end
