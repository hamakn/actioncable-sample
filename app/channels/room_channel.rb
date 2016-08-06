class RoomChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    room_user = RoomUser.find_by(
      room_id: params["room_id"],
      user_id: connection.current_user.id
    )
    if room_user
      stream_from "room_channel:#{params["room_id"]}"
    else
      reject
    end
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
