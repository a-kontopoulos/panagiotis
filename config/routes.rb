Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #route to homepage
  root to: 'static_pages#index'


  get  '/index', to: 'static_pages#index'
  get  '/contact', to: 'static_pages#contact'
  #route to new user path

  #routes for users
  get 'signup', to: 'users#new'
  #creating the paths functions for users, edit, update
  resources :users, only: [ :create, :edit, :update]

  #routes for sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
