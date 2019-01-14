FactoryBot.define do
  factory :budget_type do |f|
    f.sequence(:name){|n| "budget_type_#{n}"}
  end
end

# == Schema Information
#
# Table name: budget_types
#
#  id           :bigint(8)        not null, primary key
#  name         :string           not null
#  display_name :jsonb            not null
#  note         :text
#  position     :integer          default(1), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
