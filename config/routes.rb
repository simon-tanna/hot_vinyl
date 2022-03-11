Rails.application.routes.draw do

  resources :categories
  resources :products do
  resources :orders, only:[:new, :create]
  end
  devise_for :users
  root to: "home#index"
  # routes for seller's listed items and user placed orders
  get '/my_selling_products', to: 'products#my_selling_products', as: 'my_selling_products'
  get 'orders/index', to: 'orders#index'
  # get 'orders/new', to: 'orders#new'
  # post 'orders/create', to:'orders#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
