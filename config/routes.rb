Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root 'posts#index'

  get 'me'       => 'pages#show'
  get 'download' => 'pages#download_pdf'
  get 'pages/basic_download'


  resources :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
