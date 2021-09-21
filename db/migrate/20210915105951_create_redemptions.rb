class CreateRedemptions < ActiveRecord::Migration[6.1]
  def change
    create_table :redemptions do |t|
      t.references :coupon, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
