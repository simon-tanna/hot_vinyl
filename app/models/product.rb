class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_one_attached :picture
  has_one :order
  has_one :review
  # Ensures fields essential to the operation of the application are present
  validates :name, :artist, :price, :vinyl_weight, :catalog_number, presence: true
  validates :price, numericality: true
  validates :vinyl_weight, numericality: { in: 120..220 }

end
