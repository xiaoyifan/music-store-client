Rails.application.routes.draw do

  root 'help#show'

  get '/help' => 'help#show'

  resources :users
  resources :stores
  resources :products
  resources :orders

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
