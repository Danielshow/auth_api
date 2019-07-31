Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks:  'overrides/omniauth_callbacks'
  }

  post '/profile' => 'profile#create'
  get '/profile' => 'profile#index'
  put '/profile' => 'profile#update'
  get '/index' => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
