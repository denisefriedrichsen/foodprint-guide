Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products, only: [:index, :show]
  resources :posts, only: [:index, :show]
  resources :producers, only: [:show]
  resources :favourite_producers, only: [:create, :index, :destroy]
  resources :favourite_producers, only: [:create, :index, :destroy]
end
