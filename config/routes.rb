Rails.application.routes.draw do

  devise_for :users
  resources :products
  resources :vendors, only: [:index]
  root 'pages#home'
  get 'pages/about', as: :about

end
