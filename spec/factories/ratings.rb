FactoryBot.define do
  factory :rating do
    rate { 1 }
    resource_id { 1 }
    resource_type { "MyString" }
    user_id { nil }
  end
end
