Rails.application.routes.draw do
  root to: 'application#angular'

  # From my understanding, once you use devise for the users, you shouldn't use this route as well else it will confuse things
  # resources :users

  devise_for :users, :controllers => {
    sessions: 'sessions', registrations: 'user/registrations', passwords: 'user/passwords'
  }
  resources :chats, only: [:show, :create] do
    resources :messages
  end

  resources :stations, only: [:index, :show]
  resources :users, only: [:show,:index]
  resources :kardma_exchanges, only: [:create]
end
