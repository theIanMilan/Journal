Rails.application.routes.draw do
  devise_for :users

  # HOME
  root 'home#index'
  get '/home',          to: 'home#index'

  resources :categories do
    resources :tasks
  end
end
