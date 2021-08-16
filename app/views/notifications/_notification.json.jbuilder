json.extract! notification, :id, :title, :content, :sender_id, :recipient_id, :status, :created_at, :updated_at
json.url notification_url(notification, format: :json)
