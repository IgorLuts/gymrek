Rails.application.routes.draw do
  root 'store#index'

  get '/404' => 'errors#not_found'
  get '/500' => 'errors#internal_server_error'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)

  post '/products/:product_id/comments' => 'comments#create', as: 'product_comments'
  get '/catalog' => 'products#index', as: 'products'

  resources :visitors, only: [:create]
  resources :articles, only: [:index, :show]
  resources :orders, only: [:index, :show, :new, :create]
  resources :users, only: [:show]
  resource :shopping_cart, only: [:show, :destroy]
  resource :shopping_cart_items, only: [:create, :destroy]
  resources :contacts, only: [:new, :create] do
    post 'callback', on: :collection, as: :callback
  end
  resources :brands, only: [:show]
  resources :attachments, only: [:index]
  get ':id' => 'pages#show', as: :page

  get 'c/:id' => 'categories#show', :as => :category_short
  get 'c/:category/:id' => 'categories#show', :as => :category_long
  get '/p/:id' => 'products#show', as: 'product'
end
