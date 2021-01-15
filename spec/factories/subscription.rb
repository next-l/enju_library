FactoryBot.define do
  factory :subscription do
    sequence(:title){|n| "subscription_#{n}"}
    association :user
  end
end
