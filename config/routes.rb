Rails.application.routes.draw do
  root 'home#index'

  resources :categories do
    resources :tasks
  end
end