class CreateLoungeMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :lounge_messages do |t|
      t.references :user, foreign_key: true
      t.string :body

      t.timestamps
    end

    add_index :lounge_messages, :created_at
  end
end
