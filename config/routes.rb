Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  get 'categories/show'

  ActiveAdmin.routes(self)

  get 'orders/index'

  get 'orders/new'

  get 'orders/create'

  get 'orders/show'

  get 'orders/confirm_orders'

  get 'sessions/logout'

  get 'sessions/login'

  post 'sessions' => 'sessions#create'

  get 'registration' => 'users#new', as: 'registration'

  post 'users' => 'users#create'

  resources :products do
    member do
      post 'add_to_cart'
    end
  end

  resources :categories, only: [:show, :index]

  root 'products#index'
  get 'cart' => 'products#show_cart'
  get 'clear_cart' => 'products#clear_cart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
