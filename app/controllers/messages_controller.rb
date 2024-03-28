class MessagesController < ApplicationController
  before_action :valid_user

  def index
    current_user = User.find(session[:user_id])
    @rooms = Room.total(current_user.id)
    render "mainpage/messages/index"
  end

  def direct
    messaged_user = User.find_by(username: params[:user])
    current_user = User.find(session[:user_id])
    if Room.between(current_user.id, messaged_user.id).present?
      @room = Room.between(current_user.id, messaged_user.id).first
    else
      @room = Room.create!(sender_id: current_user.id, recipient_id: messaged_user.id)
    end    
    @room.save  
    render "mainpage/messages/direct_message"
  end
end
