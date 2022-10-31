Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :admin do
    resources :users, only: [:index]
  end
  root to: 'users#index'
  resources :users, only: [:index, :show]
  resources :reservations, only: [:index, :new, :create, :show, :destroy] do
    collection do
      post 'confirm'
    end
    resources :certificates, only: [:show, :new, :create, :edit, :update]
  end
  resources :cars, only: [:new, :create, :edit, :update, :destroy]
end