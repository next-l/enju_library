class Withdraw < ActiveRecord::Base
  belongs_to :basket
  belongs_to :item, touch: true
  belongs_to :librarian, class_name: 'User'

  validates :item_id,
    uniqueness: true, #{ message: I18n.t('withdraw.already_withdrawn', locale: I18n.default_locale) },
    presence: true #, { message: I18n.translate('withdraw.item_not_found', locale: I18n.default_locale) }
  validates_presence_of :basket_id
  validate :check_item

  attr_accessor :item_identifier

  paginates_per 10

  def check_item
    errors.add(:item) if item.try(:rent?)
    errors.add(:item) if item.try(:reserved?)
  end
end

# == Schema Information
#
# Table name: withdraws
#
#  id           :integer          not null, primary key
#  basket_id    :integer
#  item_id      :integer
#  librarian_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
