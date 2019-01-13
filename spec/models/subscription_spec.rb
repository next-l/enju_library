# -*- encoding: utf-8 -*-
require 'rails_helper'

describe Subscription do
  fixtures :subscriptions, :manifestations, :subscribes

  it "should_respond_to_subscribed" do
    subscriptions(:subscription_00001).subscribed(manifestations(:manifestation_00001)).should be_truthy
  end
end

# == Schema Information
#
# Table name: subscriptions
#
#  id               :bigint(8)        not null, primary key
#  title            :text             not null
#  note             :text
#  user_id          :bigint(8)
#  order_list_id    :bigint(8)
#  deleted_at       :datetime
#  subscribes_count :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
