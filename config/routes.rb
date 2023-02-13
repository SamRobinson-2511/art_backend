Rails.application.routes.draw do
  resources :arts
  resources :visits
  resources :viewers

  post '/login', to: 'sessions#create', as: 'login'
  post '/register', to: 'sessions#create', as: 'register'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
