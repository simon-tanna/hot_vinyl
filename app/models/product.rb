class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :picture
  has_one :order
  has_one :review
  # Ensures fields essential to the operation of the application are present
  validates :name, :artist, :price, :vinyl_weight, :catalog_number, presence: true
  validates :name, length: { in: 1..50 }
  validates :artist, length: { in: 1..50 }
  validates :price, numericality: { in: 1..50000 }
  validates :vinyl_weight, numericality: { in: 120..220 }
  validates :catalog_number, length: { in: 4..12 }
  validates :category, presence: true
end
