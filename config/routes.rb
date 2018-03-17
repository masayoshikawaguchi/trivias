Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'rankings/clip', to: 'rankings#clip'
  
  resources :users, only: [:show, :new, :create]
  
  resources :categories, only: [:index, :show]
  
  resources :trivians, only: [:index, :new, :create, :destroy]
  
  resources :clips, only: [:create, :destroy]
end
