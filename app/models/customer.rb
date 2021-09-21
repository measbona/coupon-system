class Customer < ApplicationRecord
  has_many :redemptions
  has_many :orders
end
