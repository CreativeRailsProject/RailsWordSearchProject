Rails.application.routes.draw do
  root 'searches#new'
  get '/index', to: 'searches#index'
  get '/new', to: 'searches#new'
  get '/show', to: 'searches#show'

  resources :searches
end
