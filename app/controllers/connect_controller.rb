class ConnectController < ApplicationController
  before_action :valid_user

  def index
    current_user = User.find(session[:user_id])
    create_preferences(current_user)
    @searched_users = User.where(username: 'taestyy40222')
    render "mainpage/connect/index"
  end

  def create_preferences(user)
    if user.settings.type == "Artist"
      chosen_artists = ChosenArtist.where(artist_id: user.settings.artist_id)
      chosen_artists.each do |chosen|
        @searched_users = User.nearby(chosen.user, user)
      end
    elsif user.settings.type == "Genre"
    else
      
    end
  end
end
