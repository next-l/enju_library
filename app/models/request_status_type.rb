class RequestStatusType < ActiveRecord::Base
  include MasterModel
  validates :name, presence: true, format: { with: /\A[0-9A-Za-z][0-9A-Za-z_\-\s,]*[0-9a-z]\Z/ }
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
#  name         :string           not null
#  display_name :text
#  note         :text
#  position     :integer
#  created_at   :datetime
#  updated_at   :datetime
#
