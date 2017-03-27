class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :purchases
  has_many :buyers, through: :purchases
  has_many :reviews

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end

end
