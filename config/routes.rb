Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  # get '/cart', to: 'carts#index'
  # post '/cart', to: 'carts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/orders', to: 'orders#index'

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :users, only: [:new, :create, :edit, :update]

  resources :orders, only: [:index, :show, :create, :edit, :update]

  resources :categories, only: [:index]
  resources :experiences, only: [:index, :show, :new, :create, :destroy]




  resource :cart, only: [:create, :update, :show]
  put '/cart/remove', to: 'carts#remove'

  get '/:category_slug', to: "categories#show", as: :category

end
