class RequestStatusType < ActiveRecord::Base
  include MasterModel
  validates :name, presence: true, format: { with: /\A[0-9A-Za-z][0-9A-Za-z_\-\s,]*[0-9a-z]\Z/ }
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
#  id           :bigint(8)        not null, primary key
#  name         :string           not null
#  display_name :jsonb
#  note         :text
#  position     :integer          default(1), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
