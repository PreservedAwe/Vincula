class SettingsController < ApplicationController
  before_action :valid_user

  def index
    @current_user = User.find(session[:user_id])
    render "mainpage/settings/index"
  end
end
