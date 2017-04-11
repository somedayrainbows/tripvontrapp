Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, params: :name do
    resources :experiences, only: [:index]
  end
  
  resources :carts
end
