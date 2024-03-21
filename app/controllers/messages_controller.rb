class MessagesController < ApplicationController
  before_action :valid_user

  def index
    @conversations = Conversation.where(sender: session[:user_id]) + Conversation.where(receipient: session[:user_id])
    render "mainpage/messages/index"
  end
end
