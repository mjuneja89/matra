Rails.application.routes.draw do
 
  resources :images
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

  get '/team' => 'team#team'
  resources :travels
  get '/awards' => 'awards#awards'
  resources :awards
  get '/publications' => 'publications#publications'
  resources :publications
  get '/travel' => 'destinations#travel'
  resources :destinations
  get '/archive' => 'archives#archives'
  resources :archives
  get 'contact' => 'officepics#contact'
  resources :officepics

  get '/adminview' => 'admin#adminview'

  resources :strips do
    resources :projects do
      get '/selectcover' => "projects#selectcover"
    end 
  end

 get 'search' => 'searches#search'
 
 resources :images do
    put '/cover' => "images#cover"
 end
 
end
