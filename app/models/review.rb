class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :comment, :rating, presence: true
  validates :comment, length: { in: 15..200 }
  validates :rating, numericality: { only_integer: true }
end
