Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :index do
    resources :favorites, only: [:index, :create ]
  end
  resources :favorites, only: [:destroy]
  resources :cars
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
