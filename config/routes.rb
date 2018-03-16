Rails.application.routes.draw do
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

  root 'products#index'
  get 'cart' => 'products#show_cart'
  get 'clear_cart' => 'products#clear_cart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
