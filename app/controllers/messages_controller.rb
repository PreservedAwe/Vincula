class MessagesController < ApplicationController
  before_action :valid_user

  def index
    render "mainpage/messages/index"
  end
end
