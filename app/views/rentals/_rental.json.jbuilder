json.extract! rental, :id, :client_id, :movie_id, :status, :created_at, :updated_at
json.url rental_url(rental, format: :json)
