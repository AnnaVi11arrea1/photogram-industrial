json.extract! follow_request, :id, :sender_id, :recepient_id, :status, :created_at, :updated_at
json.url follow_request_url(follow_request, format: :json)
