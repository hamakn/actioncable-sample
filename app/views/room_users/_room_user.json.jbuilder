json.extract! room_user, :id, :room_id, :user_id, :created_at, :updated_at
json.url room_user_url(room_user, format: :json)