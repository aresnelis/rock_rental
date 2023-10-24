Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root to: "rocks#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
