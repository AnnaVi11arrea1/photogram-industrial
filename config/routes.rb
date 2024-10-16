Rails.application.routes.draw do
  root "photos#index"

  resources :likes
  resources :comments
  resources :followers
  resources :photos
  devise_for :users
  devise_for :usernames

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html



end
