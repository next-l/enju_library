class Basket < ApplicationRecord
  default_scope { order('baskets.id DESC') }
  scope :will_expire, lambda {|date| where('created_at < ?', date)}
  belongs_to :user
  has_many :accepts
  has_many :withdraws

  validate :check_suspended

  attr_accessor :user_number

  def check_suspended
    if user
      errors[:base] << I18n.t('basket.this_account_is_suspended') if user.locked_at
    else
      errors[:base] << I18n.t('user.not_found')
    end
  end

  def self.expire
    Basket.will_expire(Time.zone.now.beginning_of_day).destroy_all
    logger.info "#{Time.zone.now} baskets expired!"
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
