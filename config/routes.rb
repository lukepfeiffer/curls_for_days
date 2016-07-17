Rails.application.routes.draw do
  resources :users
  resources :bloggers, only: [:index, :show]
  resources :blog_posts
  resources :subscriptions

  root to: 'blog_posts#index'

  post '/sign_in', to: 'sessions#create'

  get '/create_subscription', to: 'subscriptions#create_subscription'
  get '/destroy_subscription', to: 'subscriptions#destroy_subscription'

  delete '/sign_out', to: 'sessions#destroy'

end
