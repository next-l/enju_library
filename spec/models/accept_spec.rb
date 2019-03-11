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
#  id           :uuid             not null, primary key
#  basket_id    :uuid
#  item_id      :uuid
#  librarian_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
