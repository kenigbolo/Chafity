Rails.application.routes.draw do

  resources :appointments
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" , registrations: 'registrations'}
  resources :users #, only: [:show, :edit, :update, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
  get '/about', to: 'home#about'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
