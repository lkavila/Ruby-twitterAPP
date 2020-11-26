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
  get 'profile/following', to: 'relationships#listFollowing'
  get 'profile/followers', to: 'relationships#listFollowers'
  put '/tweet/:id/like', to: 'tweets#like', as: 'like'
  put '/tweet/:id/dislike', to: 'tweets#dislike', as: 'dislike'
  post '/message/:id', to: 'messages#create'
  get '/messages/:id1(/:id2)', to: 'messages#show', as: 'getMessages'
end
