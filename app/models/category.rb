class Category < ApplicationRecord
    has_many :products
    validates :name, presence: true
    validates :name, length: { in: 2..30 }
end
