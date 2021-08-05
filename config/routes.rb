Rails.application.routes.draw do
  root 'categories#index'

  # only for nested
  resources :categories do
    resources :tasks
  end

  get '/tasks', to: 'tasks#index'
end