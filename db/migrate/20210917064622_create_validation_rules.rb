class CreateValidationRules < ActiveRecord::Migration[6.1]
  def change
    create_table :validation_rules do |t|
      t.float :valid_amount
      t.integer :limitation_count
      t.jsonb :rules
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
