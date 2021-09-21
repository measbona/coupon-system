class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :customer, null: false, foreign_key: true
      t.float :amount
      t.string :source_id

      t.timestamps
    end
  end
end
