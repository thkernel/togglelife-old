json.extract! favori, :id, :sender_id, :recipient_id, :status, :created_at, :updated_at
json.url favori_url(favori, format: :json)
