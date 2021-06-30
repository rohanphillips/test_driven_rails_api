FactoryBot.define do
  factory :order do
    item_name { "MyString" }
    Customer { nil }
  end
end
