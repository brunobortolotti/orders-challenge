class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  validates :name, presence: true
  validates :price, presence: true
end
