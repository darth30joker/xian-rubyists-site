require 'ffaker'

FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    fullname { Faker::Name.name }
    email { Faker::Internet.email }
    birthday Faker::Time.date(year_range:25, year_latest: 18)
    password 'xianrubyist'
    password_confirmation 'xianrubyist'
  end

end


