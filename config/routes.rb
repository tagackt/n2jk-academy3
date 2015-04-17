Rails.application.routes.draw do

  get 'home/index'

  root 'home#index'
  get 'hoge/index'

  resources :comments
  resources :reports
  devise_for :users
end
