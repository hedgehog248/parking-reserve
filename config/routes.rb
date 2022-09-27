Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: 'reservations#index'
  resources :users, only: :show
  resources :reservations, only: [:index, :show]
end