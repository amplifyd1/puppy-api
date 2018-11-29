FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'wes@bar.com'
    password 'wesley'
  end
end
