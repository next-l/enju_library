require 'rails_helper'

describe Subscription do
  it "should_respond_to_subscribed" do
    subscribe = FactoryBot.create(:subscribe)
    expect(subscribe.subscription.subscribed(subscribe.work)).to be_truthy
  end
end

# == Schema Information
#
# Table name: subscriptions
#
#  id               :bigint           not null, primary key
#  title            :text             not null
#  note             :text
#  user_id          :bigint
#  order_list_id    :bigint
#  subscribes_count :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
