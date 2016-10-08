Rails.application.routes.draw do


  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" , registrations: 'registrations'}
  resources :users , only: [:index, :show] do
    resources :messages
  end
  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
  get '/about', to: 'home#about'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
