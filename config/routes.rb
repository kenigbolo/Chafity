Rails.application.routes.draw do

  get 'any/index'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  get 'home/index'
  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
