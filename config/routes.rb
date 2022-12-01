Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :shops do
    resources :products, only: [:new, :create, :edit, :show]
    resources :reviews, only: [:create]
  end

  resources :reservations, only: [:create, :update, :destroy, :index]
    resources :products, only: [:destroy, :update] do
    resources :basket_products, only: [:create]
  end

  resources :basket, only: [:show]
  resources :basket_products, only: [:destroy]
end
