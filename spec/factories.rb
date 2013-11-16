require 'faker'

def random_date(from = 0.0, to = Time.now)
  Time.at(from + Random.rand * (to.to_f - from.to_f)).to_date
end

FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name(nil, %w(- _)) }
    fullname { Faker::Name.name }
    email { Faker::Internet.email }
    birthday random_date(Time.new(1970, 1, 1), Time.new(1995, 1, 1))
    password 'xianrubyist'
    password_confirmation 'xianrubyist'
  end

end


