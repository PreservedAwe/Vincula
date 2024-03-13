Rails.application.routes.draw do
  
  root 'home#index'
  get '/search_artist/:query' , to: 'profile#search_artist'
  get '/settings' , to: 'settings#index'
  get '/edit_profile' , to: 'profile#edit'
  get '/profile' , to: 'profile#index'
  get '/register' , to: 'register#index'
  get '/about', to: 'about#index' 
  get '/contact_us', to: 'contact_us#index' 
  get '/safety_tips', to: 'safety_tips#index' 
  get '/log_in', to: 'log_in#index'
  get '/log_out', to: 'log_out#index'
  post '/log_in', to: 'log_in#is_user' 
  get '/menu', to: 'menu#index'
  get '/support', to: 'support#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
