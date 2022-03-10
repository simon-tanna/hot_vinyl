Rails.application.routes.draw do

  resources :products
  devise_for :users
  root to: "home#index"

  get 'orders/index', to: 'orders#index'
  get 'orders/new', to: 'orders#new'
  post 'orders/create', to:'orders#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
