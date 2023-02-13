Rails.application.routes.draw do
  resources :wishlists
  resources :galleries
  resources :reviews
  resources :arts
  resources :visits
  resources :viewers

  post '/login', to: 'sessions#create', as: 'login'
  post '/register', to: 'sessions#create', as: 'register'

  get '/fetch', to: 'application#fetch'
  post '/search', to: 'application#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
