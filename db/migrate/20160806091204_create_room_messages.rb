class CreateRoomMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :room_messages do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.string :body

      t.timestamps
    end

    add_index :room_messages, :created_at
  end
end
