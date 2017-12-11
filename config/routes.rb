Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'feeds#index'

  resources :users, only: [:new, :create, :index, :show]

  resource :session, only: [:new, :create, :destroy]
  
  resources :fotos do
	  resources :comments, only: [:new, :create, :edit, :update, :destroy]
	end
  
  
end
