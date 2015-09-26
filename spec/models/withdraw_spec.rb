require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  it "should change circulation_status" do
    withdraw = FactoryGirl.create(:withdraw)
    withdraw.item.circulation_status.name.should eq 'Removed'
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
