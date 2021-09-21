class Coupon < ApplicationRecord
  has_many :redemptions
  has_one :validation_rule

  STATUSES = ['inactive', 'active']
  COUPON_TYPES = ['percentage', 'amount']

  validates :coupon_code, :coupon_type, :value,
            :published_at, :valid_until, :status, presence: :true

  validates :status, inclusion: { in: STATUSES,
            message: "%{value} is not a valid status" }

  validates :coupon_type, inclusion: { in: COUPON_TYPES,
            message: "%{value} is not a valid coupon type" }
end
