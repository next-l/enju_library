class Withdraw < ApplicationRecord
  belongs_to :basket
  belongs_to :item, touch: true
  belongs_to :librarian, class_name: 'User'

  validates :item_id,
    uniqueness: true, #{ message: I18n.t('withdraw.already_withdrawn', locale: I18n.default_locale) },
    presence: true #, { message: I18n.translate('withdraw.item_not_found', locale: I18n.default_locale) }
  validates :basket_id, presence: true

  attr_accessor :item_identifier

  paginates_per 10
end

# == Schema Information
#
# Table name: withdraws
#
#  id           :bigint           not null, primary key
#  basket_id    :bigint
#  item_id      :bigint
#  librarian_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
