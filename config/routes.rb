Rails.application.routes.draw do
  root "photos#index"

  devise_for :users

  resources :likes
  resources :comments
  resources :followers
  resources :photos

  get "/:username" => "users#show", as: :user
end
