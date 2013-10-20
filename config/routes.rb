IBeautySpaNyc::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
  mount Ckeditor::Engine => "/ckeditor"

  resources :cosmetics, only: [:index, :show]
  resources :orders

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
    resources :listings
  end

  get "checkout", to: "checkout#checkout"
  get "completed_payment_request", to: "checkout#accomplish"
  get "canceled_payment_request",  to: "checkout#cancel"
  post "checkout_notification", to: "checkout#notification"
end
