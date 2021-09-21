Rails.application.routes.draw do
  # devise_for :users

  root to: "coupons#index"

  resources :coupons
end
