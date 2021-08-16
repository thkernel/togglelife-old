json.extract! blocking, :id, :sender_id, :recipient_id, :status, :created_at, :updated_at
json.url blocking_url(blocking, format: :json)
