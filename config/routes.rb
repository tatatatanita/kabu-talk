Rails.application.routes.draw do
  devise_for :users
  root 'users#edit'
  resources :users, only: [:edit, :update]
  resources :forums, only: [:new, :create, :edit, :update]
end