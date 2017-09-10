Rails.application.routes.draw do

  resources :products
  devise_for :users
  root 'pages#home'
  get 'pages/about', as: :about

end
