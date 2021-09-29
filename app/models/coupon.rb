class Coupon < ApplicationRecord
  has_many :redemptions
  has_many :customers, through: :redemptions
  has_one :validation_rule

  belongs_to :campaign

  STATUSES = ['inactive', 'active', 'distributed', 'validated', 'redeemed', 'expired']
  COUPON_TYPES = ['percentage', 'amount']

  validates :coupon_code, :coupon_type, :value,
            :published_at, :valid_until, :status, presence: :true

  validates :status, inclusion: { in: STATUSES,
            message: "%{value} is not a valid status" }

  validates :coupon_type, inclusion: { in: COUPON_TYPES,
            message: "%{value} is not a valid coupon type" }

  def self.coupon_generator
    chars.each_with_index do |char, index|
      if length == 1 then
        coupon_code = prefix + code + char + suffix
        coupon_type = ["percentage", "amount"].sample
        value = [10, 15, 20, 5, 20].sample
        valid_until = Date.new(2021, 9, 30)
        published_at = Date.new()
  
        Coupon.create(coupon_code: coupon_code, coupon_type: coupon_type, value: value, status: "active", valid_until: valid_until, published_at: published_at)
      else
        coupon_generator(chars, length - 1, code + char, prefix, suffix)
      end
    end
  end
end
