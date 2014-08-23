class RequestStatusType < ActiveRecord::Base
  attr_accessible :name, :display_name, :note
  include MasterModel
  validates :name, presence: true, format: {with: /\A[0-9A-Za-z][0-9A-Za-z_\-\s,]*[0-9a-z]\Z/}
  default_scope { order('request_status_types.position') }
  has_many :reserves

  private
  def valid_name?
    true
  end
end

# == Schema Information
#
# Table name: request_status_types
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  display_name :text
#  note         :text
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

