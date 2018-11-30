FactoryBot.define do
  factory :like do
    user_id { Faker::Number.number(10) }
    post_id { Faker::Number.number(10) }
  end
end
