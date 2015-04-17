Rails.application.routes.draw do
  get 'users/auth/github/callback' => 'sessions#create'

  resources :users do
    resources :reports do
      resources :comments
    end
  end
  devise_for :users

  root 'home#index'
end
