Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :shops do
    resources :products, only: [:new, :create, :edit, :show]
    resources :reviews, only: [:create]
    resources :chats, only: :create
  end

  resources :reservations, only: [:new, :create, :update, :destroy, :index]
  resources :products, only: [:destroy, :update, :edit] do
    resources :basket_products, only: [:create]
  end

  resources :basket, only: [:show]
  resources :basket_products, only: [:destroy]
  resources :chats, only: :show do
    resources :messages, only: [:create]
  end
  get "/my_shop", to: "shops#my_shop"
  get "/about", to: "pages#about"
  get "/qr-collected", to: "reservations#qr_collected"
end
