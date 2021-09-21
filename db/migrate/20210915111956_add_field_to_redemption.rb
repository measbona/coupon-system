class AddFieldToRedemption < ActiveRecord::Migration[6.1]
  def change
    add_column :redemptions, :amount, :float
    add_column :redemptions, :status, :string
    add_column :redemptions, :metadata, :jsonb
  end
end
