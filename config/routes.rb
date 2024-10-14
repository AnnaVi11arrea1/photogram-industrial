Rails.application.routes.draw do
  resources :followers
  resources :photos
  devise_for :users
  devise_for :usernames

  root "photos#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # User routes
  get "/users/sign_up", controller: "users", action: "new"
  post "/users/sign_up", controller: "users", action: "create"

  get "/users/sign_out", controller: "users", action: "sign_out"
  delete "/users/sign_out", controller: "users", action: "goodbye_session"

  get "/users/:username", controller: "users", action: "index"
  get "/users/edit", controller: "users", action: "edit"
  patch "/users/edit", controller: "users", action: "update"
  delete "/users/delete", controller: "users", action: "destroy"

  get "/users/feed", controller: "users", action: "feed"
  get "users/discover", controller: "users", action: "discover"
  get "/users/profile", controller: "users", action: "show"

  #photos 
  get "photos/edit", controller: "photos", action: "edit"
  post "photos/create", controller: "photos", action: "create"
  get "photos/:id/comments", controller: "comments", action: "index"
  patch "photos/edit", controller: "photos", action: "update"
  delete "photos/delete", controller: "photos", action: "destroy"
end
