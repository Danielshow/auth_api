Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    omniauth_callbacks: 'overrides/omniauth_callbacks',
    sessions: 'overrides/sessions',
    registrations: 'overrides/registrations',
    confirmations: 'overrides/confirmations',
    passwords: 'overrides/passwords'
  }

  get '/profile' => 'profile#index'
  put '/profile' => 'profile#update'
  get '/index' => 'home#index'
  get '/admin/users' => 'admin#index'
  get '/admin/login' => 'admin#login'
  post '/admin/login' => 'admin#create'
  get '/admin/logout' => 'admin#logout'
  get '/assets' => 'public#index'
  post '/reset/password' => 'admin#reset_password'
  get '/reset/password' => 'admin#reset'
  get 'confirm/message' => 'admin#message'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
