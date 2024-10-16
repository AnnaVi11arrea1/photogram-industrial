Rails.application.routes.draw do
  root "photos#index"

  resources :likes
  resources :comments
  resources :followers
  resources :photos
  devise_for :users
  devise_for :usernames

end
