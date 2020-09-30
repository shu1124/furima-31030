FactoryBot.define do
  factory :user do
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}  
    nickname               {Faker::Name.initials(number: 2)}
    family_name            {Gimei.last.kanji}
    first_name             {Gimei.first.kanji}
    family_kana            {Gimei.last.katakana}
    first_kana             {Gimei.first.katakana}
    date                   {Faker::Date.between(from: '1930-01-01', to: '2019-01-01')}
  end
end
