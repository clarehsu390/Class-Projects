Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums do
    resources :tracks, only: [:new]
  end
    resources :tracks, only: [:edit, :create, :show, :update, :destroy]
end
