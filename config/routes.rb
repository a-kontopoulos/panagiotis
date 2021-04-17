Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #route to homepage
  root to: 'static_pages#index'


  get 'static_pages/index', to: 'static_pages#index'
  get 'real_estate', to: 'static_pages#realEstate'
  get 'white_collar', to: 'static_pages#whiteCollarCrime'
  get 'civil_law', to: 'static_pages#civilLaw'
  get 'immigration', to: 'static_pages#immigration'
  get 'tax', to: 'static_pages#tax'
  get 'invest_in_greece', to: 'static_pages#investInGreece'


  get  'contact', to: 'messages#new'
  #creating the paths functions for users, edit, update
  resources :messages, only: [:new, :create]


  #route to new user path

  #routes for users
  get 'signup', to: 'users#new'
  #creating the paths functions for users, edit, update
  resources :users, only: [:new, :create]

  #routes for sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
