Rails.application.routes.draw do
  get 'users/auth/github/callback' => 'sessions#create'

  devise_for :users
  resources :users do
    resources :reports do
      resources :comments
    end
  end

  root 'home#index'
end
