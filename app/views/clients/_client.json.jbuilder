json.extract! client, :id, :identification, :email, :name, :created_at, :updated_at
json.url client_url(client, format: :json)
