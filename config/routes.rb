Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:index, :show, :new] do
    resources :categories, only: [:new, :create, :show, :index, :destroy]
    resources :transactions, only: [:new, :create, :index, :show, :destroy]
  end
end
