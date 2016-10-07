Rails.application.routes.draw do

  namespace :admin do
    resources :users
resources :appointments

    root to: "users#index"
  end

  resources :appointments
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users #, only: [:show, :edit, :update, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
  get '/about', to: 'home#about'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
