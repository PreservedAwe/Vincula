class ProfileController < ApplicationController
  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      render "mainpage/profile/index"
    else  
      redirect_to "/log_in"
    end  
  end

  def edit
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @location = Geocoder.search("Paris")
      render "mainpage/profile/edit"
    else  
      redirect_to "/log_in"
    end  
  end

  def search_artist
    artists = RSpotify::Artist.search(params[:query])
    render json: artists
  end

end
