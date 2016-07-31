
Rails.application.routes.draw do
  root to: 'application#angular'

  # From my understanding, once you use devise for the users, you shouldn't use this route as well else it will confuse things
  # resources :users

  devise_for :users, :controllers => {
                       sessions: 'sessions', registrations: 'user/registrations', passwords: 'user/passwords'
                   }
  resources :chats, only: [:show, :create] do
    resources :messages
    collection do
      get 'open_chat/:user_id' => 'chats#get_chat_for_user'
    end
  end

  resources :stations, only: [:index, :show]
  resources :users, only: [:show,:index]
  resources :kardma_exchanges, only: [:index, :create, :destroy, :show] do
      collection do
        put 'update_with_match/:id' => 'kardma_exchanges#update_with_match'
        put 'update_with_complete/:id' => 'kardma_exchanges#update_with_complete'
        get 'pending_exchange/:user_id' => 'kardma_exchanges#show_pending_exchange_for_user'
      end
    end
end