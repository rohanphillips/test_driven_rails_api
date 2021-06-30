FactoryBot.define do
  factory :order do
    item_name { Faker::String.random(length: 4) }
    Customer { nil }
  end
end
