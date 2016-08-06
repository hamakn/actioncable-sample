# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LoungeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lounge_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post_message(data)
    connection.current_user.update_name data["message"]["name"]
    message = connection.current_user.lounge_messages.create(
      body: data["message"]["body"]
    )
    ActionCable.server.broadcast "lounge_channel", message: message.to_h
  end
end
