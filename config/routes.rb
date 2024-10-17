Rails.application.routes.draw do
   root "photos#index"

  devise_for :users

  resources :comments
  resources :followers
  resources :likes
  resources :photos

  get ":username/likes" => "users#likes"

  get ":username" => "users#show", as: :user

end
