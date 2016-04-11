Rails.application.routes.draw do
  root "flights#index"
  get "login" => "sessions#new"
  post "/auth/identity/callback" => "sessions#create"
  post "/auth/identity/register" => "sessions#create"
  get "/auth/:provider/callback" => "sessions#create"
  get "failure" => "sessions#failure"
  get "/auth/failure" => redirect("/failure")
  get "logout" => "sessions#destroy"
  get "findme" => "bookings#findme"
  get "find" => "bookings#find"
  get "mybooking" => "users#show"
  get "express_checkout" => "bookers#express_checkout"
  delete "/bookings/:id" => "bookings#destroy", as: :remove
  get "all_flights" => "flights#all_flights"

  resources :identities, only: [:new]
  resources :bookers, only: [:new, :create]
  resources :flights
  resources :bookings, except: [:index]
  resources :passengers
end
