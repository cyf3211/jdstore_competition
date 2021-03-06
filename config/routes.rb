Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end
  end

  resources :products do
    put :favorite, on: :member
    collection do
      get :search
      get :category
    end
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders

  resources :favorite

  namespace :account do
    resources :orders
  end
end
