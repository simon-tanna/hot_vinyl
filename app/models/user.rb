class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :orders
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Ensures there is no duplication of unique fields
  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
