Rails.application.routes.draw do

  # Connexion page
  root 'welcome#index'

  # Authentification
  post '/auth/connect'      => 'auth#login'
  post '/auth/subscribe'    => 'auth#create'
  get '/auth/logout'        => 'auth#logout'

  # Dashboard
  match '/dashboard'        => 'dashboard#index', via: [:get, :post]

  # Tweet
  get '/tweet/:id/like'     => 'tweet#like'

  # Account
  get '/account/:username'  => 'account#index'
  get '/account/:id/follow' => 'account#follow'

  # Search
  get '/search/'            => 'search#index'

end
