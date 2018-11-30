FactoryBot.define do
  factory :post do
    text { Faker::Dog.meme_phrase }
    photo { Faker::Pokemon.move }
    user_id { Faker::Number.number(10) }
  end
end
