class Bookstore < ActiveRecord::Base
  has_many :items
  belongs_to :bookstore_type

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
#  id               :integer          not null, primary key
#  name             :text             not null
#  zip_code         :string
#  address          :text
#  note             :text
#  telephone_number :string
#  fax_number       :string
#  url              :string
#  position         :integer
#  deleted_at       :datetime
#  created_at       :datetime
#  updated_at       :datetime
#
