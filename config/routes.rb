IBeautySpaNyc::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get "dashboard/show"

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
  mount Ckeditor::Engine => "/ckeditor"

  resources :cosmetics, only: [:index, :show]
  resources :orders, only: [:show]
  get "/checkout", to: "orders#new"

  get "/cart", to: "cart#show"
  post "/cart", to: "cart#add_product"
  delete "/cart", to: "cart#remove_product"
  put "/cart", to: "cart#update"

  namespace :admin do
    get '/', to: "dashboard#show"
    resources :cosmetics
    resources :gift_certificates
    resources :orders
    resources :brands
  end
end
