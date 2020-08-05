Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }
  get "/users/:id", to: "users#show"
  get "/users", to: "users#index"
  root to: "books#index"
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
