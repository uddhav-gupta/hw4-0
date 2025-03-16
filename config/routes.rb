Rails.application.routes.draw do
  root 'places#index'

  # User sessions for login/logout
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # User registration
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  # Places & nested entries
  resources :places, only: [:index, :show, :new, :create] do
    resources :entries, only: [:new, :create]
  end
end
