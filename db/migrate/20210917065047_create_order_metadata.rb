class CreateOrderMetadata < ActiveRecord::Migration[6.1]
  def change
    create_table :order_metadata do |t|
      t.references :order, null: false, foreign_key: true
      t.references :metadata, null: false, foreign_key: true

      t.timestamps
    end
  end
end
