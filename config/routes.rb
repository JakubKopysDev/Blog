Rails.application.routes.draw do
  get 'sessions/new'
  get 'me'      => 'pages#show'
  root 'posts#index'
  resources :posts
  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
