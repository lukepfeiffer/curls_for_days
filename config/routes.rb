Rails.application.routes.draw do
  resources :users
  resources :bloggers, only: [:index, :show]
  resources :blog_posts

  root to: 'blog_posts#index'

  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'

end
