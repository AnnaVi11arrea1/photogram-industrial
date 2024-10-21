Rails.application.routes.draw do
   root "photos#index"

  devise_for :users

  resources :likes
  resources :comments
  resources :followers
  resources :likes
  resources :photos
  
  get "/:username/likes" => "users#likes"
  get "/:username/feed" => "users#feed"
  get "/:username/followers" => "users#followers"
  get "/:username/following" => "users#following"
  get "/:username" => "users#show", as: :user

end
