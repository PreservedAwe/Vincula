class MessagesController < ApplicationController
  before_action :valid_user

  def index
    current_user = User.find(session[:user_id])
    @rooms = Room.total(current_user.id)
    if @rooms.first != []
      render "mainpage/messages/index"
    else
      render "mainpage/messages/empty"      
    end
  end

  def direct
    messaged_user = User.find_by(username: params[:user])
    current_user = User.find(session[:user_id])
    if messaged_user
      if Room.between(current_user.id, messaged_user.id).present?
        @room = Room.between(current_user.id, messaged_user.id).first
      else
        @room = Room.create!(sender_id: current_user.id, recipient_id: messaged_user.id)
        ActionCable.server.broadcast("user_#{current_user.id}", {data: @room})
        ActionCable.server.broadcast("user_#{messaged_user.id}", {data: @room})
      end    
      @room.save  
      render "mainpage/messages/direct_message"
    else
      render "mainpage/messages/direct_message_nil"
    end

    
  end

  def send_message
    user = User.find(session[:user_id])
    message = Message.create!(body: params[:message], user: user, room: Room.find(params[:room]))
    message.save
    ActionCable.server.broadcast("room_#{message.room.id}", {username: user.username, body: message.body})
  end

end
