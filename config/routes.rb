Rails.application.routes.draw do
  get 'sessions/new'

  root 'posts#index'
  resources :posts
  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
