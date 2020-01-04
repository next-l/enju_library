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
#  id           :bigint           not null, primary key
#  basket_id    :bigint
#  item_id      :bigint
#  librarian_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
