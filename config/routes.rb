Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/studios/:id', to: 'studios#show'

  get '/movies/:id', to: 'movies#show'
  post '/movies/:id', to: 'movies#show'

  get '/actors/:id', to: 'actors#show'
end
