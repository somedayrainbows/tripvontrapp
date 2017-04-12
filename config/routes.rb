Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # get '/cart', to: 'carts#index'
  # post '/cart', to: 'carts#index'

  resources :users, only: [:new, :create, :show]
  get '/', to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  resources :categories, only: [:index, :show]
  resources :experiences, only: [:index]


  resource :cart

end
