Rails.application.routes.draw do
  devise_for :users
  
  root 'projects#index'

  resources :projects do 
  	resources :rewards, only: [:new, :create, :edit, :update, :destroy]
  	resources :pledges
  	resources :payments, only: [:new, :create]
  end
end
