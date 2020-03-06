Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products, only: [:index, :show]
  resources :favourite_products, only: [:create, :index, :destroy]
  resources :producers, only: [:show]
  resources :favourite_producers, only: [:create, :index, :destroy]
  resources :posts, only: [:index, :show]
  # resources :profiles, only: [:edit, :update]
  # patch '/users/update', to: 'profiles#update', as: :update_user
  # get '/profile/edit', to: 'profiles#edit', as: :edit_user
end
