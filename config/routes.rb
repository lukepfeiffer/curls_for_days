Rails.application.routes.draw do
  resources :users

  root to: 'pages#home'

  post '/sign_in', to: 'sessions#create'
end
