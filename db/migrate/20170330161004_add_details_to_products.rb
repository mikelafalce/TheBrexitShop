class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :details, :text
  end
end
