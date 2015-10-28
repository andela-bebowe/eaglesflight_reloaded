Rails.application.routes.draw do
  root "sessions#new"
  get "signup" => "identities#new"
  get "login" => "sessions#new"
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure" => redirect("/")
  get "logout" => "sessions#destroy"

  resources :identities
end
