class Color < ActiveRecord::Base
  #attr_accessible :code, :property

  belongs_to :library_group
  validates :code, presence: true, format: /\A[A-Fa-f0-9]{6}\Z/
  validates :property, presence: true, uniqueness: true, format: /\A[a-z][0-9a-z_]*[0-9a-z]\Z/

  acts_as_list
end

# == Schema Information
#
# Table name: colors
#
#  id               :bigint(8)        not null, primary key
#  library_group_id :bigint(8)
#  property         :string
#  code             :string
#  position         :integer          default(1), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
