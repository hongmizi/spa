IBeautySpaNyc::Application.routes.draw do
  get "admin/show"

  get "products/show"

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'

  resources :products, only: [:index, :show]

  namespace :admin do
    get '/', to: "admin#show"
    resources :products
    resources :brands
  end
end
