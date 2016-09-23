Rails.application.routes.draw do
  devise_for :users
  
  root 'projects#index'

  resources :projects do 
  	resources :rewards, only: [:new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
