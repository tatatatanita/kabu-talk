Rails.application.routes.draw do
  devise_for :users
  root 'forums#index'
  resources :users, only: [:edit, :update]
  resources :forums, only: [:index, :new, :create, :edit, :update]
end