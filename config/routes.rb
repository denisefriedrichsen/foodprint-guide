Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products, only: [:index, :show] do
    resources :favourite_products, only: [:create, :index, :destroy]
  end

  resources :producers, only: [:show] do
    resources :favourite_producers, only: [:create, :index, :destroy]
  end

  resources :posts, only: [:index, :show]
  # resources :profiles, only: [:edit, :update]
  # patch '/users/update', to: 'profiles#update', as: :update_user
  # get '/profile/edit', to: 'profiles#edit', as: :edit_user
end
