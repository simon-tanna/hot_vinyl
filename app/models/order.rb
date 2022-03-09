class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :user
  has_many :products
end
