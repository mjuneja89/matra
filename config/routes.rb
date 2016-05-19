Rails.application.routes.draw do
  get '/' => 'home#home'

  get '/create' => 'users#new'
  post '/create' => 'users#create'
  resources :users do
  	get '/avatar' => 'users#avatar'
    patch '/updateavatar' => 'users#updateavatar'
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/adminview' => 'admin#adminview'

  resources :strips do
    resources :projects 
  end

end
