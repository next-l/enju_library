class Accept < ActiveRecord::Base
  belongs_to :basket
  belongs_to :item, touch: true
  belongs_to :librarian, class_name: 'User'

  validates :item_id, uniqueness: true, presence: true #, message:  I18n.t('accept.already_accepted')
  validates :basket_id, presence: true
#  validates :item_id, presence: true

  attr_accessor :item_identifier

  paginates_per 10
end

# == Schema Information
#
# Table name: accepts
#
#  id           :integer          not null, primary key
#  basket_id    :uuid
#  librarian_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
