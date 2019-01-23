# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :accept do
    basket_id{FactoryBot.create(:basket).id}
    item_id{FactoryBot.create(:item).id}
    librarian_id{FactoryBot.create(:librarian).id}
  end
end

# == Schema Information
#
# Table name: accepts
#
#  id           :bigint(8)        not null, primary key
#  basket_id    :bigint(8)
#  item_id      :uuid
#  librarian_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
