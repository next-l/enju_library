require 'rails_helper'

describe Accept do
  fixtures :all

  it "should change circulation_status" do
    accept = FactoryBot.create(:accept)
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
