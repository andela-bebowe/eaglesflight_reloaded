Rails.application.routes.draw do
  root "sessions#new"
  get "login" => "sessions#new"
  post "/auth/identity/callback" => "sessions#create"
  get "/auth/:provider/callback" => "sessions#create"
  get "failure" => "sessions#failure"
  get "/auth/failure" => redirect("/failure")
  get "logout" => "sessions#destroy"

  resources :users
  resources :identities
end
