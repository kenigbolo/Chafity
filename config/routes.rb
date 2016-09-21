Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'user/:id', to: 'users#show', as: 'user_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
