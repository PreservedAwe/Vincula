class RoomChannel < ApplicationCable::Channel
  def subscribed
    user = User.find_by(username: params[:username])
    stream_for "user_#{user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
