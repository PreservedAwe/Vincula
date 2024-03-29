class SettingsController < ApplicationController
  before_action :valid_user

  def index
    @current_user = User.find(session[:user_id])
    @search_types = SearchType.where.not(id: @current_user.setting.search_type)
    render "mainpage/settings/index"
  end

  def edit
    user_settings = User.find(session[:user_id]).setting 
    user_settings.max_distance = params[:distance]
    user_settings.genre_id = params[:genre_1]
    user_settings.artist_id = params[:artist_1]
    user_settings.tag_id = params[:tag_1]
    user_settings.search_type = params[:search_type]
    user_settings.is_enabled = params[:is_enabled]
    if user_settings.save
      redirect_to "/settings", notice: "Settings Update Successful"
    else
      redirect_to "/settings", notice: "Settings Update Unsuccessful"
    end     
  end
  
end
