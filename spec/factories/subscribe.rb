FactoryBot.define do
  factory :subscribe do
    association :subscription
    association :work, factory: :manifestation
    start_at { 1.year.ago }
    end_at { 1.year.from_now }
  end
end
