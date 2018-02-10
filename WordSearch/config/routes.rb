Rails.application.routes.draw do
  root 'searches#index'
  get '/index', to: 'searches#index'
  get '/new', to: 'searches#new'
  get '/show', to: 'searches#show'
  
 
  resources :searches do
    member do
      get '/key', to: 'searches#key'
	end
  end
end
