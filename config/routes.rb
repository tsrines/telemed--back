Rails.application.routes.draw do
  resources :conversations, only: %i[index create show]
  resources :messages, only: %i[create index]
  mount ActionCable.server => '/cable'

  resources :searches, only: %i[create index show]
  resources :reviews
  resources :photos
  resources :favorites
  resources :doctors
  resources :users

  post '/signup', to: 'users#create'
  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'

  get '/geocodes/details/:id', to: 'geocodes#getdetails'
  get '/geocodes/address', to: 'geocodes#getaddress'
  get '/geocodes/coords', to: 'geocodes#get_coords'
  get '/geocodes/nearby', to: 'geocodes#nearby_search'
end
