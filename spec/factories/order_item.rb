# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :order_item do
    order
    product

    quantity { 4 }
    unit_price { 3 }
    total_amount { 12 }
  end
end
