Rails.application.routes.draw do
  root 'categories#index'
  devise_for :users

  resources :categories, only: %i[index new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
