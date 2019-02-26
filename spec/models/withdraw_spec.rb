require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  fixtures :all

  it "should change circulation_status" do
    withdraw = FactoryBot.create(:withdraw)
  end

  it "should not withdraw rented item" do
    withdraw = Withdraw.new(librarian: users(:librarian1))
    withdraw.item = items(:item_00013)
    withdraw.valid?.should be_falsy
  end
end

# == Schema Information
#
# Table name: withdraws
#
#  id           :bigint(8)        not null, primary key
#  basket_id    :uuid
#  item_id      :uuid
#  librarian_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
