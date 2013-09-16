FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :brand do
    description "description"
    name "name"
  end

  factory :cosmetic do
    association :brand, factory: :brand
    name "name"
    description "description"
  end

  factory :option_type do
    name "color"
    association :purchasable, factory: :cosmetic
  end

  factory :option_value do
    name "red"
    association :option_type, factory: :option_type
  end
end
