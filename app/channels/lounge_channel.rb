# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LoungeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lounge_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post_message(data)
    ActionCable.server.broadcast "lounge_channel", message: data["message"]
  end
end
