FactoryBot.define do
  factory :purchase_address do
    token            { 'tok_abcdefghijk00000000000000000' }
    postal_code      { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    city             { Gimei.city.kanji }
    number           { Gimei.town.kanji }
    building         { Faker::Address.building_number }
    phone_number     { Faker::Number.number(digits: 10) }
    prefectures_id   { Faker::Number.between(from: 1, to: 47) }
  end
end
