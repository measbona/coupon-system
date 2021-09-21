class AddOrderFieldToRedemption < ActiveRecord::Migration[6.1]
  def change
    add_reference :redemptions, :order, foreign_key: true
  end
end
