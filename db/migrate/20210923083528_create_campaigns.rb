class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :prefix
      t.string :suffix
      t.integer :code_length
      t.integer :code_count
      t.string :charset
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
