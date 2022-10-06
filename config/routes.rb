Rails.application.routes.draw do
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
  end
end