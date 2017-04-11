Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get   '/cart',       to: 'carts#index'
    # get   ':name',       to: 'categories#show', as: :category


  resources :experiences, only: [:index] do
    resources :categories, only: [:show]
  end

  resources :categories, only: [:index]

  resources :carts
end
