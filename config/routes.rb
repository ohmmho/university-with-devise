Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root('links#home')

  get '/register', to: 'sessions#new'
  post '/register', to: 'sessions#create'


  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  resources :users


end
