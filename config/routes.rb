Rails.application.routes.draw do
  # get 'transactions/index'
  root 'users#index'
  devise_for :users
  get '/transactions/:id', to: 'transactions#index', as: 'transactions'
  # get '/transactions/new', to: 'transactions#new', as: 'new_transaction'
  resources :categories, only: %i[index new create] do
    resources :transactions, only: %i[index new create]
  end
  resources :users, only: %i[index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
