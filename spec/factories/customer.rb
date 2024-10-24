# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :customer do
    name { 'nombre' }
    email { 'email@email.com' }
  end
end
