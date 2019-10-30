Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  
  
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  resources :users
  resources :topics do
    resources :posts
  end
  
  
  resources :comments, only: [:create]
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
end