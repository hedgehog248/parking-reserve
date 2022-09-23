Rails.application.routes.draw do
  devise_for :users
  root to: 'reservations#index'
  resources :users, only: :show
end