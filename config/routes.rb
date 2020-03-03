Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :producers, only: [:show]
  resources :favourite_producers, only: [:create, :index, :destroy]
end
