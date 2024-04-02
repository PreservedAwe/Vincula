class ConnectController < ApplicationController
  before_action :valid_user

  def index
    current_user = User.find(session[:user_id])
    @searched_users = create_preferences(current_user)
    if @searched_users.first == nil 
      render "mainpage/connect/empty"      
    else
      render "mainpage/connect/index"
    end
  end

  def view_profile
    @current_user = User.find_by(username: params[:username])
    if @current_user == nil 
      redirect_to "/connect"
    end
    render "mainpage/connect/view_profile"
  end

  def create_preferences(user)
    @searched_users = []
    if user.setting.is_enabled == true
      if user.setting.search_type == 1
        chosen_artists = ChosenArtist.where(artist_id: user.setting.artist_id)
        chosen_artists.each do |chosen|
          @searched_users.concat(User.excluding(user).nearby(chosen.user, user))
        end
      elsif user.setting.search_type == 2
        chosen_genres = ChosenGenre.where(genre_id: user.setting.genre_id)
        chosen_genres.each do |chosen|
          @searched_users.concat(User.excluding(user).nearby(chosen.user, user)) 
        end      
      else
        chosen_tags = ChosenTag.where(tag_id: user.setting.tag_id)
        chosen_tags.each do |chosen|
          @searched_users.concat(User.excluding(user).nearby(chosen.user, user)) 
        end     
      end
    else
      @searched_users = User.excluding(user).all.limit(10)
    end
    @searched_users = @searched_users.uniq
    return FisherYates.shuffle(@searched_users).first(10) 
  end
end
