Rails.application.routes.draw do # rubocop:disable Style/FrozenStringLiteralComment
  resources :wishlists
  resources :galleries
  resources :reviews
  resources :arts
  resources :visits
  resources :viewers, only: %i[show create index]

  post '/login', to: 'sessions#create', as: 'login'
  post '/register', to: 'viewers#create', as: 'register'
  get '/fetch', to: 'application#fetch'
  post '/search', to: 'application#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
