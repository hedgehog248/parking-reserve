Rails.application.routes.draw do
  namespace :admin do
    resources :reservations, only: [:index, :show]
    resources :users, only: [:index]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

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