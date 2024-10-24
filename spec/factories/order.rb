# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :order do
    customer
    total_amount { 5 }
    # order_status { 'pending' }
    # payment_status { }
    # fulfillment_status { }
  end
end
