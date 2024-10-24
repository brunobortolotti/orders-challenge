FactoryBot.define do
  factory :order do
    customer
    order_status { 'pending' }
    payment_status { 'awaiting_payment' }
    fulfillment_status { 'awaiting_fulfillment' }
    total_amount { 100 }
  end
end