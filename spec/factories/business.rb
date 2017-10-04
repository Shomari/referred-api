FactoryGirl.define do
  factory :business do
    association :category, factory: :category
  end
end
