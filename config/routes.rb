Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'gallery/index'
  resources :stores
  get 'admin/login'
  devise_for :users
  get 'home/index'
  post 'admin/login'
  get 'gallery/search'
  post 'gallery/search'
  get 'admin/logout'
  get 'gallery/checkout'
  post 'gallery/checkout'
  get 'gallery/purchase_complete'

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
