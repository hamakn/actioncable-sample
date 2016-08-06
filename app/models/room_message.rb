class RoomMessage < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def created_at_to_s
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def to_h
    {
      id: id,
      room_id: room_id,
      user_id: user_id,
      user_name: user.name,
      body: body,
      created_at: created_at_to_s,
    }
  end
end
