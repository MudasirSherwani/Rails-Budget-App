Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :operations
  resources :categories, only: [:index, :show, :new, :create] do
    get 'operations', to: 'operations#index', as: 'operations'
  end
  get 'operations/index'
  get 'user/index'
  get '/', to: 'categories#index'
end