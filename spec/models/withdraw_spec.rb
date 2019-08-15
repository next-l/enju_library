require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  fixtures :all

  it "should change circulation_status" do
    withdraw = FactoryBot.create(:withdraw)
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
