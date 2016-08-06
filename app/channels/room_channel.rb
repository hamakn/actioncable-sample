class RoomChannel < ApplicationCable::Channel
  def follow(data)
    # TODO: auth
    stop_all_streams
    stream_from "room_channel:#{data["room_id"]}"
  end

  def post_message(data)
    connection.current_user.update_name data["message"]["name"]
    room = Room.find data["room_id"]
    message = connection.current_user.room_messages.create(
      room_id: room.id,
      body: data["message"]["body"]
    )
    ActionCable.server.broadcast "room_channel:#{room.id}", message: message.to_h
  end
end
