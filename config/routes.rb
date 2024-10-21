Rails.application.routes.draw do
   root "photos#index"

  devise_for :users

  root "photos#index"

  devise_for :users

  resources :likes
  resources :comments
  resources :followers
  resources :likes
  resources :photos

  get "/:username" => "users#show", as: :user
end
