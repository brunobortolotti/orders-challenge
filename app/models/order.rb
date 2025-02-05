class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :total_amount, presence: true

  enum :order_status, {
    pending: 'pending',
    completed: 'completed'
  }, prefix: true, default: :pending

  enum :payment_status, {
    awaiting_payment: 'awaiting_payment',
    payment_declined: 'payment_declined',
    paid: 'paid'
  }, prefix: true, default: :awaiting_payment

  enum :fulfillment_status, {
    awaiting_fulfillment: 'awaiting_fulfillment',
    shipped: 'shipped',
    delivered: 'delivered'
  }, prefix: true, default: :awaiting_fulfillment
end
