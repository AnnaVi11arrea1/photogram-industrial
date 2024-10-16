Rails.application.routes.draw do
   root "photos#index"

  devise_for :users

  root "photos#index"

  resources :likes
  resources :comments
  resources :followers
  resources :likes
  resources :photos
  devise_for :users
  devise_for :usernames

end
