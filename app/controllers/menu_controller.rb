class MenuController < ApplicationController
  before_action :valid_user

  def index
    render "mainpage/menu/index"
  end
end
