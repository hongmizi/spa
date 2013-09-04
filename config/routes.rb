IBeautySpaNyc::Application.routes.draw do
  get "dashboard/show"

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'

  resources :cosmetics, only: [:index, :show]

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
