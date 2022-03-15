class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :comment, :rating, presence: true
  validates :comment, length: { in: 15..200, too_short: "%{count} characters is the minimum allowed", too_long: "%{count} characters is the maximum allowed" }
  validates :rating, numericality: { only_integer: true }
end
