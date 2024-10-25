Rails.application.routes.draw do
  root "photos#index"

  devise_for :users

  resources :comments
  resources :follow_requests
  resources :photos
  resources :likes

  get "/users/:id" => "users#edit"

  get "/:username/liked" => "users#likes", as: :liked

  get "/:username/followers" => "users#followers"

  get "/:username/following" => "users#following", as: :following

  get "/:username/feed" => "users#feed", as: :feed

  get "/:username/discover" => "users#discover", as: :discover

  get "/:username" => "users#show", as: :user

end
