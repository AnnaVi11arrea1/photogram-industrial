Rails.application.routes.draw do
   root "photos#index"

  devise_for :users

  resources :comments
  resources :followers
  resources :likes
  resources :photos

  get ":username/likes" => "users#likes"

  get ":username/followers" => "users#followers"
  get ":username/following" => "users#following", as: :following

  get ":username" => "users#show", as: :user
  get ":username/discover" => "users#discover", as: :discover

  get "user/:id" => "users#profile"
  get "/user/:id/feed" => "users#feed", as: :feed

end
