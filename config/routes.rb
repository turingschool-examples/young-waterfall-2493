Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :studios, only: [:show]
  resources :movies, only: [:show]
  resources :casts, only: [:create]  
end
