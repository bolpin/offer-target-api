json.extract! offer, :id, :title, :header, :description, :points, :payout_cents, :created_at, :updated_at
json.url offer_url(offer, format: :json)
