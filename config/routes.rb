Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users, only: [:index, :show, :new] do
    resources :categories, only: [:new, :create, :show, :index, :destroy]
    resources :transactions, only: [:new, :create, :index, :show, :destroy]
  end
end
