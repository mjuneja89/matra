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
  get '/archive' => 'projects#archive'
  resources :travels
  get '/awards' => 'awards#awards'
  resources :awards
  get '/publications' => 'publications#publications'
  resources :publications
  get '/travel' => 'destinations#travel'
  resources :destinations
  get 'contact' => 'contact#contact'
  get 'archive' => 'archives#archive'
  resources :archives

  get '/adminview' => 'admin#adminview'

  resources :strips do
    resources :projects do
      get '/selectcover' => "projects#selectcover"
    end 
  end

 get 'search' => 'projects#index'
 
 resources :images do
    put '/cover' => "images#cover"
 end
 
end
