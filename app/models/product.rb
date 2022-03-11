class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_one_attached :picture
  has_one :order
end
