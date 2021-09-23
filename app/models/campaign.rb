class Campaign < ApplicationRecord
  has_many :coupons

  after_create :generate_coupon

  private

  def generate_coupon
    CouponGenerator.create(self)
  end
end
