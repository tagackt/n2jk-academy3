Rails.application.routes.draw do

  get 'users/show'

  get 'sessions/create'

  get 'home/index'
  root 'home#index'

  get 'users/auth/github/callback' => 'sessions#create'

  resources :users do
    resources :reports do
      resources :comments
    end
  end
  devise_for :users

end
