Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks" , registrations: 'registrations'}
  resources :users , only: [:index, :show] do
    resources :messages
  end
# =======
#   namespace :admin do
#     resources :users
# resources :appointments
#
#     root to: "users#index"
#   end
#
#   resources :appointments
#   devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
#   resources :users #, only: [:show, :edit, :update, :destroy]
# >>>>>>> 7dff8ee74dba592a711baff6b644624e68373896
  get 'auth/:provider/callback', to: 'sessions#create'
  root 'home#index'
  get '/about', to: 'home#about'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
