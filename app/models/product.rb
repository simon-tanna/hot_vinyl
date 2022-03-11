class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :picture
  has_one :order
  has_one :category
end
