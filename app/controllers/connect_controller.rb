class ConnectController < ApplicationController
  before_action :valid_user

  def index
    current_user = User.find(session[:user_id])
    @searched_users = create_preferences(current_user)
    render "mainpage/connect/index"
  end

  def view_profile
    @current_user = User.find_by(username: params[:username])
    render "mainpage/connect/view_profile"
  end

  def create_preferences(user)
    @searched_users = []
    if user.setting.is_enabled == true
      if user.setting.search_type == 1
        chosen_artists = ChosenArtist.where(artist_id: user.setting.artist_id)
        chosen_artists.each do |chosen|
          @searched_users.concat(User.nearby(chosen.user, user).limit(10)) 
        end
        return @searched_users.uniq
      elsif user.setting.search_type == 2
        chosen_genres = ChosenGenre.where(genre_id: user.setting.genre_id)
        chosen_genres.each do |chosen|
          @searched_users.concat(User.nearby(chosen.user, user).limit(10)) 
        end      
        return @searched_users.uniq
      else
        chosen_tags = ChosenTag.where(tag_id: user.setting.tag_id)
        chosen_tags.each do |chosen|
          @searched_users.concat(User.nearby(chosen.user, user).limit(10)) 
        end    
        return @searched_users.uniq  
      end
    else
      @searched_users = User.excluding(user).all.limit(10)
      return @searched_users.uniq
    end

  end
end
