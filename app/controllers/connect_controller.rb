class ConnectController < ApplicationController
  before_action :valid_user

  def index
    @current_user = User.find(session[:user_id])
    @searched_users = User.where(username: 'taestyy40222')
    render "mainpage/connect/index"
  end
end
