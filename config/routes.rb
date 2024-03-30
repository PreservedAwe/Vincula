Rails.application.routes.draw do

  #Root route
  root 'home#index'

  #Post routes
  post '/find' , to: 'find#search'
  post '/register' , to: 'register#is_valid'
  post '/log_in', to: 'log_in#is_user' 
  post '/edit_profile' , to: 'profile#update'
  post '/edit_settings' , to: 'settings#edit'
  post '/send_message' , to: 'messages#send_message'

  #Get routes
  get '/messages' , to: 'messages#index'
  get '/direct_messages' , to: 'messages#direct'
  get '/connect' , to: 'connect#index'
  get '/connect_profile' , to: 'connect#view_profile'
  get '/find' , to: 'find#index'
  get '/view_searched' , to: 'find#view_profile'
  get '/search_artist' , to: 'profile#search_artist'
  get '/search_genre' , to: 'profile#search_genre'
  get '/search_tag' , to: 'profile#search_tag'
  get '/settings' , to: 'settings#index'
  get '/edit_profile' , to: 'profile#edit'
  get '/profile' , to: 'profile#index'
  get '/register' , to: 'register#index'
  get '/about', to: 'about#index' 
  get '/contact_us', to: 'contact_us#index' 
  get '/safety_tips', to: 'safety_tips#index' 
  get '/log_out', to: 'log_out#index'
  get '/log_in', to: 'log_in#index'
  get '/menu', to: 'menu#index'
  get '/support', to: 'support#index'
  get '/get_location', to: 'profile#get_location'

  # Catch-all route
  #match '*path', to: 'errors#index', via: :all, constraints: -> (req) { !req.env['HTTP_CONNECTION'].include?('upgrade') }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
