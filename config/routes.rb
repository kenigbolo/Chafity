Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" , registrations: 'registrations', confirmations: 'confirmations'}
  resources :users , only: [:index, :show] do
    resources :messages do
      resources :responses
    end
  end

  resources :charges
  resources :searches

  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
  get '/about', to: 'home#about'
  post '/messages/reply', to: 'responses#create', as: :reply_message
  post '/charities/suggest', to: 'users#suggestion', as: :suggest_charity
  get 'accept/:id', to: 'responses#accept', as: :accept_message
  get 'reject/:id', to: 'responses#reject', as: :reject_message
  post 'message/schedule/:message_id', to: 'responses#schedule', as: :schedule_appointment

end
