Rails.application.routes.draw do # rubocop:disable Style/FrozenStringLiteralComment
  resources :wishlists
  resources :galleries
  resources :reviews
  resources :arts
  resources :visits
  resources :viewers
  
  
  #viewers routes
  get '/viewers/:id', to: 'viewers#show'
  post '/viewers/', to: 'viewers#create'
  patch '/viewers/:id', to: 'viewers#update'
  delete 'viewers/:id', to: 'viewers#destroy'
  
  #auth routes
  post '/login', to: 'auth#login'
  get '/profile', to: 'viewers#profile'
  
  post '/register', to: 'viewers#create', as: 'register'
  
  




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

  # get '/explore', to: 'arts#explore'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
