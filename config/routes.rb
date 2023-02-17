Rails.application.routes.draw do # rubocop:disable Style/FrozenStringLiteralComment
  # resources :wishlists
  # resources :galleries
  # resources :reviews
  # resources :arts
  # resources :visits
  # resources :viewers
  
  
  
  get '/authorized/:id', to: 'viewers#show'
  get '/all_galleries', to: 'galleries#index'
  get '/galleries/:id', to: 'galleries#show'
  get '/all_visits', to: 'visits#index'
  get '/viewers/:id/visit', to: 'visits#show'
  get '/arts', to: 'index#arts'
  get '/all_reviews', to: 'index#reviews'
  post '/signup', to: 'viewers#create'
  # post '/login', to: 'sessions#create'
  # post '/login', to: 'auth#login'
  post '/viewers/:id/add_visit', to: 'visits#create'
  post '/add_gallery', to: 'galleries#create'
  post '/add_review', to: 'reviews#create'
  patch '/viewers/:id/profile/edit', to: 'viewers#update'
  patch '/reviews/:id/edit', to: 'reviews#update'
  patch '/visits/:id/edit', to: 'visits#update'
  delete '/visits/:id/delete', to: 'visits#delete'
  delete 'viewers/:id', to: 'viewers#destroy'
  delete 'logout', to: 'sessions#destroy'
  
  post '/login', to: 'auth#login'
  get '/profile', to: 'viewers#profile'

  get '/fetch_art', to: 'arts#index'
  
  # post '/register', to: 'viewers#create', as: 'register'
  
  




  # JH code

  # post '/signup', to: 'users#signup'
  # get '/user', to: 'users#user_info'
  # post '/user_account', to: 'users#user_account'
  # delete '/logout', to: 'sessions#logout'


  # post '/login', to: 'sessions#create', as: 'login'
  
  # get '/fetch', to: 'application#fetch'
  # post '/search', to: 'application#search'

  # get '/my_reviews', to: 'users#get-reviews'

  # post '/new', to: 'visits#create', as: 'new'

  get '/explore', to: 'arts#explore'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
