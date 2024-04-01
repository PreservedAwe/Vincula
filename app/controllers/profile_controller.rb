class ProfileController < ApplicationController
  before_action :valid_user
  skip_before_action :valid_user, only: [:search_artist, :search_genre, :search_tag]

  def index
    @current_user = User.find(session[:user_id])
    render "mainpage/profile/index"
  end

  def edit
    @current_user = User.find(session[:user_id])
    render "mainpage/profile/edit"
  end

  def search_artist
    artists = RSpotify::Artist.search(params[:query])
    render json: artists
  end

  def search_genre
    genres = Genre.where("name LIKE ?", "%#{params[:query]}%")
    render json: genres
  end

  def search_tag
    tags = Tag.where("name LIKE ?", "%#{params[:query]}%")
    render json: tags
  end

  def get_location
    temp_user = User.find(session[:user_id]) 
    temp_user.ip_address = request.remote_ip
    if temp_user.ip_address == "127.0.0.1"
      temp_user.ip_address = "205.211.157.84"
    elsif temp_user.ip_address == nil
      temp_user.ip_address = "142.181.120.13"
    else
    end
    temp_user.save
    redirect_to "/edit_profile"
  end

  def update
    temp_user = User.find(session[:user_id]) 
    if !User.excluding(temp_user).exists?(email: params[:email]) && !User.excluding(temp_user).exists?(username: params[:username])
      temp_user.email = params[:email]
      temp_user.username = params[:username]
      if params[:profile_picture]
        temp_user.profile_picture.attach(params[:profile_picture])
      end
      if params[:profile_video]
        temp_user.profile_video.attach(params[:profile_video])
      end
      if params[:profile_songs]
        params[:profile_songs].each do |song|
            temp_user.profile_songs.attach(song)
        end
      end
      count = 0
      temp_user.chosen_artists.each do |chosen|
        count += 1
        chosen.artist_id = params["artist_#{count}"] 
      end
      count = 0
      temp_user.chosen_genres.each do |chosen|
        count += 1
        chosen.genre_id = params["genre_#{count}"] 
      end
      count = 0      
      temp_user.chosen_tag.tag_id = params[:tag_1] 
      if temp_user.save
        redirect_to "/edit_profile", notice: "Account Update Successful"
      else
        redirect_to "/edit_profile", notice: "Account Update Unsuccessful"
      end          
    else
      redirect_to "/edit_profile", notice: "User name or email already in database"
    end
  end

  def stream_media(user)
    if user.profile_video.attached?
      http_cache_forever(public: true) do
        send_blob_stream user.profile_video, disposition: 'inline'
      end
    else
    end

    user.profile_songs.each do |song|
      http_cache_forever(public: true) do
        send_blob_stream song, disposition: 'inline'
      end      
    end
 end

end
