Rails.application.routes.draw do
  resources :users

  root to: 'pages#home'

  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'
end
