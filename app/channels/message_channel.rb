class MessageChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])
    stream_for "room_#{room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
