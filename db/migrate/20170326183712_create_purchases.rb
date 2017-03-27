class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :product_id
      t.integer :buyer_id

      t.timestamps
    end
    add_index :purchases, [:product_id, :buyer_id], unique: true
  end
end
