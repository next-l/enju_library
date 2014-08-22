class Color < ActiveRecord::Base
  attr_accessible :code, :property

  belongs_to :library_group
  validates :code, presence: true, format: /\A[A-Za-z#][0-9A-Za-z_\s]*[0-9A-Za-z]\Z/
  validates :property, presence: true, uniqueness: true, format: /\A[a-z][0-9a-z_]*[0-9a-z]\Z/

  acts_as_list
end

# == Schema Information
#
# Table name: colors
#
#  id               :integer          not null, primary key
#  library_group_id :integer
#  property         :string(255)
#  code             :string(255)
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
