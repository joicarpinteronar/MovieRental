Rails.application.routes.draw do
  resources :rentals
  resources :clients
  resources :movies

  root 'movies#index'
  post '/rentals', to: 'rentals#create'
  get '/rentals/:id', to: 'rentals#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
