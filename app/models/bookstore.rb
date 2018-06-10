class Bookstore < ActiveRecord::Base
  has_many :items

  acts_as_list
  validates :name, presence: true
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
#  name             :string           not null
#  zip_code         :string
#  address          :text
#  note             :text
#  telephone_number :string
#  fax_number       :string
#  url              :string
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
