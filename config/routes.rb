Rails.application.routes.draw do
  get '/' => 'home#home'

  get '/create' => 'users#new'
  post '/create' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
