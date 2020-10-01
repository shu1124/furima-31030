FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence(word_count: 2) }
    text             { Faker::Lorem.sentence(word_count: 5) }
    fee              { Faker::Number.between(from: 1, to: 9_999_999) }
    delivery_date_id { Faker::Number.between(from: 1, to: 3) }
    delivery_fee_id  { Faker::Number.between(from: 1, to: 2) }
    prefectures_id   { Faker::Number.between(from: 1, to: 47) }
    status_id        { Faker::Number.between(from: 1, to: 6) }
    category_id      { Faker::Number.between(from: 1, to: 10) }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
