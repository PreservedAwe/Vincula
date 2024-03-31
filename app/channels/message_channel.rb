class MessageChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])
    stream_for "room_#{room.id}"
  end

  def unsubscribed
    room = Room.find(params[:room_id])
    stop_stream_from "room_#{room.id}"
  end
end
