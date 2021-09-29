class AddAssociateToCoupon < ActiveRecord::Migration[6.1]
  def change
    add_reference :coupons, :campaign, foreign_key: true
  end
end
