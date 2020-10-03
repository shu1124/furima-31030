FactoryBot.define do
  factory :purchase_address do
    token            {"tok_abcdefghijk00000000000000000"}

    prefectures_id   { Faker::Number.between(from: 1, to: 47) }
  end
end