Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" , registrations: 'registrations'}
  resources :users , only: [:index, :show] do
    resources :messages do
      resources :responses
    end
  end
  namespace :admin do
    resources :users
    resources :messages

    root to: "users#index"
  end

  resources :charges

  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
  get '/about', to: 'home#about'
  post '/messages/reply', to: 'responses#create', as: :reply_message
  # get '/messages/new/:id', to: 'messages#new', as: :new_user_message
  # post '/users/:id/messages', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
