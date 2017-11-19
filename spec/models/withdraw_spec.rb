require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  it 'should change circulation_status' do
    withdraw = FactoryBot.create(:withdraw)
    withdraw.item.circulation_status.name.should eq 'Removed'
    withdraw.item.use_restriction.name.should eq 'Not For Loan'
  end
end

# == Schema Information
#
# Table name: withdraws
#
#  id           :integer          not null, primary key
#  basket_id    :uuid
#  item_id      :uuid
#  librarian_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
