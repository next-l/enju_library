class Accept < ActiveRecord::Base
  default_scope { order('accepts.id DESC') }
  belongs_to :basket
  belongs_to :item, touch: true
  belongs_to :librarian, class_name: 'User'

  validates_uniqueness_of :item_id #, message:  I18n.t('accept.already_accepted')
  validates_presence_of :item_id #, message:  I18n.t('accept.item_not_found')
  validates_presence_of :basket_id

  attr_accessor :item_identifier

  paginates_per 10
end

# == Schema Information
#
# Table name: accepts
#
#  id           :bigint(8)        not null, primary key
#  basket_id    :uuid
#  item_id      :uuid
#  librarian_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
