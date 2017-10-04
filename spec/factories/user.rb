FactoryGirl.define do
  factory :user do
    facebook_uid  { Faker::Number.number(8) }
    email  { Faker::Internet.email }
  end
end
