class MessagesController < ApplicationController
  before_action :valid_user

  def index
    current_user = User.find(session[:user_id])
    @conversations = current_user.mailbox.inbox.all
    render "mainpage/messages/index"
  end

  def direct
    messaged_user = User.find_by(username: params[:user])
    current_user = User.find(session[:user_id])
    current_user.send_message(messaged_user, "Hello, this is a message!", "Subject")
    render "mainpage/messages/direct_message"
  end
end
