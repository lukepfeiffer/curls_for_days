Rails.application.routes.draw do
  resources :users
  get '/sign_in', to: 'sessions#new'
  root to: 'pages#home'
end
