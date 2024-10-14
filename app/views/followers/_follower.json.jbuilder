json.extract! follower, :id, :sender_id, :recepient_id, :status, :created_at, :updated_at
json.url follower_url(follower, format: :json)
