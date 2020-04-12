json.extract! movie, :id, :title, :description, :date_presentation, :created_at, :updated_at
json.url movie_url(movie, format: :json)
