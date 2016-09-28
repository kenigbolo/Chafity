Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users #, only: [:show, :edit, :update, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
