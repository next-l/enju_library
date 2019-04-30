# frozen_string_literal: true

require 'rails_helper'

describe Basket do
  fixtures :all

  it "should not create basket when user is not active" do
    basket = Basket.new
    basket.user = users(:user4)
    basket.should_not be_valid
  end
end

# == Schema Information
#
# Table name: baskets
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  note         :text
#  lock_version :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
