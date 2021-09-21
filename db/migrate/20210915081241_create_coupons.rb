class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :coupon_code
      t.string :coupon_type
      t.float :value
      t.datetime :published_at
      t.datetime :valid_until
      t.string :status

      t.timestamps
    end
  end
end
