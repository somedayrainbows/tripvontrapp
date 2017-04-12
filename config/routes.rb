Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # get '/cart', to: 'carts#index'
  # post '/cart', to: 'carts#index'


  resources :categories, only: [:index, :show]
  resources :experiences, only: [:index]


  resource :cart, only: [:create, :update, :show]
  put '/cart/remove', to: 'carts#remove'

end
