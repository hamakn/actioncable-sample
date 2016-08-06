class User < ApplicationRecord
  has_many :lounge_messages

  def update_name(new_name)
    update({ name: new_name }) if name != new_name
  end
end
