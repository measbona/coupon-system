Rails.application.routes.draw do
  resources :campaigns
  # devise_for :users

  root to: "coupons#index"

  resources :coupons
  resources :campagins
end
