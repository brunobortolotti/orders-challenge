# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :product do
    category
    name  { 'product name' }
    price { 3 }
  end
end
