Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'

  # get '/cart', to: 'carts#index'
  # post '/cart', to: 'carts#index'

  resources :users, only: [:new, :create, :show]
  get '/', to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :categories, only: [:index]
  resources :experiences, only: [:index, :show]



  resource :cart, only: [:create, :update, :show]
  put '/cart/remove', to: 'carts#remove'

  get '/:category_slug', to: "categories#show", as: :category

end
