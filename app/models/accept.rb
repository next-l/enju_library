class Accept < ApplicationRecord
  default_scope { order('accepts.id DESC') }
  belongs_to :basket
  belongs_to :item, touch: true
  belongs_to :librarian, class_name: 'User'

  validates :item_id, uniqueness: true #, message:  I18n.t('accept.already_accepted')
  validates :item_id, presence: true #, message:  I18n.t('accept.item_not_found')
  validates :basket_id, presence: true

  attr_accessor :item_identifier

  paginates_per 10
end

# == Schema Information
#
# Table name: accepts
#
#  id           :bigint           not null, primary key
#  basket_id    :bigint
#  item_id      :bigint
#  librarian_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
