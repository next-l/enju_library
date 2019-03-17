class Bookstore < ActiveRecord::Base
  default_scope { order('bookstores.position') }
  has_many :items

  acts_as_list
  validates_presence_of :name
  validates :url, url: true, allow_blank: true, length: { maximum: 255 }

  paginates_per 10

  if defined?(EnjuPurchaseRequest)
    has_many :order_lists
  end
end

# == Schema Information
#
# Table name: bookstores
#
#  id               :uuid             not null, primary key
#  name             :text             not null
#  zip_code         :string
#  address          :text
#  note             :text
#  telephone_number :string
#  fax_number       :string
#  url              :string
#  position         :integer          default(1), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
