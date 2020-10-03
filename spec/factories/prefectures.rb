FactoryBot.define do
  factory :prefecture do
    token { 'tok_abcdefghijk00000000000000000' }
    association :item
    association :user
  end
end
