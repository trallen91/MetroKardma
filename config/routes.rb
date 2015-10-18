Rails.application.routes.draw do
  devise_for :users
  root to: 'application#angular'
  # root 'stations#index'

  # get '/register' => 'users#new'

  # resources :users, only: [:create, :show]

  # get '/login' => 'sessions#new'
  # delete '/logout' => 'sessions#destroy'

  # resources :sessions, only: [:create]
  resources :chats
  resources :stations, only: [:index, :show]
end
