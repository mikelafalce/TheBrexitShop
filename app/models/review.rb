class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true, numericality: { greater_than: 1, less_than: 5 }
  validates :comment, presence: true, length: { minimum: 5 }

end
