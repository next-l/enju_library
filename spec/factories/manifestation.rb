FactoryBot.define do
  factory :manifestation do
    sequence(:original_title){|n| "manifestation_title_#{n}"}
    carrier_type_id { 1 }
    content_type_id { 1 }
    frequency_id { 1 }
  end
end
