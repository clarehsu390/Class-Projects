Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :bands do
    resources :albums, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :tracks, only: [:new, :create, :show, :edit, :update, :destroy]
end
end
