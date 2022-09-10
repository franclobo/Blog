# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]  do
      resources :comments, only: [:index, :show]
      resources :likes, only: [:index, :show]
    end
  end
  resources :posts, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
