class AddResetSentAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :reset_sent_at, :datetime
  end
end
