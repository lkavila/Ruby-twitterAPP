Rails.application.routes.draw do
  resources :tweets
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  get 'login', to: 'application#login'
  get 'home', to:'application#home'
  get 'index', to: 'application#index'
  get 'profile', to: 'application#profile'
  resources :relationships,       only: [:create, :destroy]

end
