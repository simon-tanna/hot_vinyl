Rails.application.routes.draw do

  resources :categories
  resources :products do
    resources :orders, only:[:new, :create, :index]
    resources :reviews
  end
  devise_for :users
  root to: "categories#index"
  # routes for seller's listed items and user placed orders
  get '/my_selling_products', to: 'products#my_selling_products', as: 'my_selling_products'
  get '/recently_sold', to: 'products#recently_sold', as: 'recently_sold'
  get 'orders/index', to: 'orders#index'
  # route for the search function
  get 'search', to: 'products#search'
  get 'users/:id', to: 'users#profile_view', as: 'profie_view'
  # get 'orders/new', to: 'orders#new'
  # post 'orders/create', to:'orders#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
