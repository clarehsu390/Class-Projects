Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :update, :destroy, :create, :index]
  resources :artworks, only: [:show, :update, :destroy, :create, :index]
  resources :artwork_shares, only: [:create, :destroy]
  get '/users/:user_id/artworks', to: 'users#artworks'
  get '/artworks/:artist_id/index', to: 'artworks#index'
  resources :comments, only: [:create, :destroy, :index]
end
