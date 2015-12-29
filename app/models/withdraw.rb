class Withdraw < ActiveRecord::Base
  belongs_to :basket
  belongs_to :item, touch: true
  belongs_to :librarian, class_name: 'User'

  validates_uniqueness_of :item_id, message:  I18n.t('withdraw.already_withdrawn')
  validates_presence_of :item_id, message:  I18n.t('withdraw.item_not_found')
  validates_presence_of :basket_id
  validate :check_item

  attr_accessor :item_identifier

  paginates_per 10

  def check_item
    errors.add(:item) if item.try(:rent?)
  end
end

# == Schema Information
#
# Table name: withdraws
#
#  id           :integer          not null, primary key
#  basket_id    :integer
#  item_id      :integer
#  librarian_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
