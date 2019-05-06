class UserGroup < ActiveRecord::Base
  include MasterModel
  translates :display_name
  has_many :profiles

  validates_numericality_of :valid_period_for_new_user,
    greater_than_or_equal_to: 0,
    allow_blank: true

  paginates_per 10
end

# == Schema Information
#
# Table name: user_groups
#
#  id                               :bigint           not null, primary key
#  name                             :string           not null
#  display_name_translations        :jsonb            not null
#  note                             :text
#  position                         :integer          default(1), not null
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  valid_period_for_new_user        :integer          default(0), not null
#  expired_at                       :datetime
#  number_of_day_to_notify_overdue  :integer          default(7), not null
#  number_of_day_to_notify_due_date :integer          default(3), not null
#  number_of_time_to_notify_overdue :integer          default(3), not null
#
