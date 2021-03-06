class Subscribe < ApplicationRecord
  belongs_to :subscription, counter_cache: true
  belongs_to :work, class_name: 'Manifestation'

  validates :subscription, :work, :start_at, :end_at, presence: true
  validates :work_id, uniqueness: { scope: :subscription_id }
end

# == Schema Information
#
# Table name: subscribes
#
#  id              :bigint           not null, primary key
#  subscription_id :bigint           not null
#  work_id         :integer          not null
#  start_at        :datetime         not null
#  end_at          :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
