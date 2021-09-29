class Campaign < ApplicationRecord
  after_create :generate_coupon

  has_many :coupons
  has_many :redemptions, through: :coupons

  validates :name, :code_length, :code_count, :charset, presence: :true

  private

  def generate_coupon
    CouponGenerator.create(self)
  end
end
