Rails.application.routes.draw do
  root to: 'application#angular'
  # root 'stations#index'

  # get '/register' => 'users#new'

  # resources :users, only: [:create, :show]

  # get '/login' => 'sessions#new'
  # delete '/logout' => 'sessions#destroy'

  # resources :sessions, only: [:create]

  # resources :stations, only: [:index, :show]
end
