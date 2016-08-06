class LoungeMessage < ApplicationRecord
  belongs_to :user

  def created_at_to_s
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def to_h
    {
      id: id,
      user_id: user.id,
      user_name: user.name,
      body: body,
      created_at: created_at_to_s,
    }
  end
end
