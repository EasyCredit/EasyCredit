Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :credits
  resources :users
  root :to => 'visitors#index'
end
