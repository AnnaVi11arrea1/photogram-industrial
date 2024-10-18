Rails.application.routes.draw do
  root "photos#index"

  devise_for :users

  resources :likes
  resources :comments
  resources :follow_requests
<<<<<<< HEAD
  resources :likes
  resources :photos
  
<<<<<<< HEAD
=======
  
>>>>>>> 2cdf639 (fixing routes)
  get "/users/:id" => "users#edit"
  
  get "/:username/liked" => "users#likes", as: :liked
  
<<<<<<< HEAD
  get "/:username/followers" => "users#followers", as: :followers
=======
  get "/:username/followers" => "users#followers"
>>>>>>> 2cdf639 (fixing routes)
  
  get "/:username/following" => "users#following", as: :following
  
  get "/:username/feed" => "users#feed", as: :feed
  
  get "/:username/discover" => "users#discover", as: :discover
  
  get "/:username" => "users#show", as: :user
<<<<<<< HEAD
=======
  resources :photos
>>>>>>> f197ce4 (fix routes)
=======
>>>>>>> 2cdf639 (fixing routes)

  get "/users/:id" => "users#edit"
  
  get "/:username/liked" => "users#likes", as: :liked
  
  get "/:username/followers" => "users#followers", as: :followers
  
  get "/:username/following" => "users#following", as: :following
  
  get "/:username/feed" => "users#feed", as: :feed
  
  get "/:username/discover" => "users#discover", as: :discover
  
  get "/:username" => "users#show", as: :user
end
