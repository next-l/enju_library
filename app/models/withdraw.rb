class Withdraw < ActiveRecord::Base
  belongs_to :basket
  belongs_to :item, touch: true
  belongs_to :librarian, class_name: 'User'

  validates_uniqueness_of :item_id, message:  I18n.t('withdraw.already_withdrawn')
  validates_presence_of :item_id, message:  I18n.t('withdraw.item_not_found')
  validates_presence_of :basket_id

  attr_accessor :item_identifier

  paginates_per 10
end
