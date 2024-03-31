class RoomChannel < ApplicationCable::Channel
  def subscribed
    user = User.find_by(username: params[:username])
    stream_for "user_#{user.id}"
  end

  def unsubscribed
    user = User.find_by(username: params[:username])
    stop_stream_from "user_#{user.id}"
  end
end
