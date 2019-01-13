class Subscription < ActiveRecord::Base
  has_many :subscribes, dependent: :destroy
  has_many :works, through: :subscribes
  belongs_to :user, validate: true
  if defined?(EnjuPurchasRequest)
    belongs_to :order_list, validate: true
  end

  validates_presence_of :title, :user
  validates_associated :user

  searchable do
    text :title, :note
    time :created_at
    time :updated_at
    integer :work_ids, multiple: true
  end

  paginates_per 10

  def subscribed(work)
    subscribes.where(work_id: work.id).first
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
