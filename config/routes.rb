Rails.application.routes.draw do
  # devise_for :users

  root to: "coupons#index"

  namespace :api do
    namespace :v1 do
      resources :coupons
      resources :customers
      resources :redemptions
    end
  end

  resources :coupons
  resources :campaigns
  resources :campagins
  resources :customers
end
