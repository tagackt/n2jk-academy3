Rails.application.routes.draw do

  get 'sessions/create'

  get 'home/index'
  root 'home#index'

  get 'users/auth/github/callback' => 'sessions#create'

  resources :comments
  resources :reports
  devise_for :users
end
