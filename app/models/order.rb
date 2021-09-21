class Order < ApplicationRecord
  belongs_to :customer
  has_one :redemption

  has_many :order_metadata
  has_many :order_items

  STATUSES = ['created', 'paid', 'cancelled', 'fullfiled']

  validates :status, presence: :true

  validates :status, inclusion: { in: STATUSES,
    message: "%{value} is not a valid status" }
end
