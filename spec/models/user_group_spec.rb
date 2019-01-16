require 'rails_helper'

describe UserGroup do
  fixtures :user_groups

  it "should contain string in its display_name" do
    user_group = user_groups(:user_group_00001)
    user_group.display_name = "en:test"
    user_group.valid?.should be_truthy
  end
end

# == Schema Information
#
# Table name: user_groups
#
#  id                               :bigint(8)        not null, primary key
#  name                             :string
#  display_name                     :jsonb            not null
#  note                             :text
#  position                         :integer          default(1), not null
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  valid_period_for_new_user        :integer          default(0), not null
#  expired_at                       :datetime
#  number_of_day_to_notify_overdue  :integer          default(1), not null
#  number_of_day_to_notify_due_date :integer          default(7), not null
#  number_of_time_to_notify_overdue :integer          default(3), not null
#
