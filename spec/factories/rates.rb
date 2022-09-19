FactoryBot.define do
  factory :rate do
    user_id { 1 }
    resource_id { 1 }
    resource_type { "MyString" }
    rating { 1 }
  end
end
