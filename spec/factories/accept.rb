# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :accept do
    basket{FactoryBot.create(:basket)}
    item{FactoryBot.create(:item)}
    librarian{FactoryBot.create(:librarian)}
  end
end

# == Schema Information
#
# Table name: accepts
#
#  id           :integer          not null, primary key
#  basket_id    :integer
#  item_id      :integer
#  librarian_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#
