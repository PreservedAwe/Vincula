class ProfileController < ApplicationController
  before_action :valid_user

  def index
    @current_user = User.find(session[:user_id])
    render "mainpage/profile/index"
  end

  def edit
    @current_user = User.find(session[:user_id])
    @location = Geocoder.search("Paris")
    render "mainpage/profile/edit"
  end

  def search_artist
    artists = RSpotify::Artist.search(params[:query])
    render json: artists
  end

  def get_location
    ip = request.remote_ip
    temp_user = User.find(session[:user_id]) 
    temp_user.ip_address = ip
    temp_user.save
    redirect_to "/edit_profile"
  end

  def update
    temp_user = User.find(session[:user_id]) 
    temp_user.username = params[:username]
    if temp_user.save
      redirect_to "/edit_profile", notice: "Account Update Successful"
    else
      redirect_to "/edit_profile", notice: "Account Update Unsuccessful"
    end
  end

end
