FactoryBot.define do
  factory :post do
    text { Faker::Dog.meme_phrase }
    photo { Faker::Pokemon.move }
    created_by { Faker::Number.number(10) }
  end
end
