Rails.application.routes.draw do
  root "flights#index"
  get "login" => "sessions#new"
  post "/auth/identity/callback" => "sessions#create"
  post "/auth/identity/register" => "sessions#create"
  get "/auth/:provider/callback" => "sessions#create"
  get "failure" => "sessions#failure"
  get "/auth/failure" => redirect("/failure")
  get "logout" => "sessions#destroy"
  get "mybooking" => "users#show"

  resources :identities, only: [:new]
  resources :flights, only: [:index]
  resources :bookings, except: [:index]
  resources :passengers
end
