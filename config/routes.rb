Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'sessions/new'
  get 'me'       => 'pages#show'
  get 'download' => 'pages#download_pdf'
  get 'pages/basic_download'
  root 'posts#index'
  resources :posts
  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
