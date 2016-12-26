Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :credits
    resources :requests
  end
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :credits, only: [:index, :show]
  resources :requests
  resources :users
  root :to => 'visitors#index'
end
