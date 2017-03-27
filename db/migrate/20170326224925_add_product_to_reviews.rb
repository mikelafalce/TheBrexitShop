class AddProductToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :product, foreign_key: true
  end
end
