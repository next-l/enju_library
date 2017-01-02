# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :accept do
    basket{FactoryGirl.create(:basket)}
    item{FactoryGirl.create(:item)}
    librarian{FactoryGirl.create(:librarian)}
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
