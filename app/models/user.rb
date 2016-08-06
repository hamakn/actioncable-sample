class User < ApplicationRecord
  has_many :room, through: :room_users
  has_many :lounge_messages
  has_many :room_messages

  def update_name(new_name)
    update({ name: new_name }) if name != new_name
  end
end
