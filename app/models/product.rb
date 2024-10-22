class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  validates :name, presence: true
  validates :default_price, presence: true

  enum :product_type, {
    physical: 'physical',
    digital: 'digital'
  }, prefix: true

  def current_price
    sale_price || default_price
  end
end
