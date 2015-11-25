Rails.application.routes.draw do

  root 'products#index'

  get '/help' => 'help#show'

  resources :users
  resources :stores
  resources :products
  resources :orders

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'

  get  '/auth/:provider/callback' => 'sessions#create'
  #post '/auth/:provider/callback' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  get '/pay' => 'payments#new'
  post '/charge' => 'payments#create'

end
