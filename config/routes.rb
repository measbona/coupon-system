Rails.application.routes.draw do
  # devise_for :users

  root to: "coupons#index"

  namespace :api do
    namespace :v1 do
      resources :coupons
    end
  end

  resources :coupons
  resources :campaigns
  resources :campagins
  resources :customers
end
