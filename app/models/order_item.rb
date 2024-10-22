class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :total_amount, presence: true
end
