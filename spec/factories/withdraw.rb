# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :withdraw do
    basket_id{FactoryGirl.create(:basket).id}
    item_id{FactoryGirl.create(:item).id}
    librarian_id{FactoryGirl.create(:librarian).id}
  end
end

# == Schema Information
#
# Table name: withdraws
#
#  id           :integer          not null, primary key
#  basket_id    :integer
#  item_id      :integer
#  librarian_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
