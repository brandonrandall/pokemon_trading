Rails.application.routes.draw do

  root "users#index"

  get "/login",     to: "sessions#new"
  post "/login",    to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :rewards
  end

  resources :rewards, only: [:index, :new, :create] do
    resources :favorites, only: [:create, :destroy]
  end
end
