Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }
  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    resources :books, only: [:index, :show], module: 'users'
  end
  root to: "books#index"
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
