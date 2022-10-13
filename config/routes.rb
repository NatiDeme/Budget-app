Rails.application.routes.draw do
  get 'transactions/index'
  root 'users#index'
  devise_for :users

  resources :categories, only: %i[index new create]
  resources :users, only: %i[index]
  resources :transactions, only: %i[index new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
