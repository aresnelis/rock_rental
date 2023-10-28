Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root to: "rocks#index"
  get '/dashboard', to: "pages#dashboard"

  resources :rocks do
    resources :bookings, only: [:new, :create, :show]
  end

  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
