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
  get '/award' => 'awards#awards'
  resources :awards
  get '/publication' => 'publications#publications'
  resources :publications
  get '/video' => 'videos#videos'
  resources :videos
  get '/travel' => 'destinations#travel'
  resources :destinations
  get '/archive' => 'archivestrips#archives'
  resources :archivestrips do
    resources :archives
  end  
  get 'contact' => 'officepics#contact'
  resources :officepics

  get '/adminview' => 'admin#adminview'

  resources :strips do
    get '/editpriority' => "strips#editpriority"
    patch '/updatepriority' => "strips#updatepriority"
    resources :projects do
      get '/selectcover' => "projects#selectcover"
      get '/editimages' => "projects#editimages"
    end 
  end

 get 'matrasearch' => 'searches#search'
 
 resources :images do
    get '/doyou' => "images#doyou"
    put '/cover' => "images#cover"
    get '/editpriority' => "images#editpriority"
    patch '/updatepriority' => "images#updatepriority"
 end
 
end
