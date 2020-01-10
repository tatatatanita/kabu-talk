Rails.application.routes.draw do
  devise_for :users
  root 'forums#index'
  resources :users, only: [:index, :edit, :update]
  resources :forums, only: [:index, :new, :create, :edit, :update] do
    resources :posts, only: [:index, :create]
  end
end