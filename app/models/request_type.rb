class RequestType < ActiveRecord::Base
  include MasterModel
  validates :name, presence: true, format: { with: /\A[0-9A-Za-z][0-9A-Za-z_\-\s,]*[0-9a-z]\Z/ }
  translates :display_name

  private

  def valid_name?
    true
  end
end

# == Schema Information
#
# Table name: request_types
#
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  display_name_translations :jsonb            not null
#  note                      :text
#  position                  :integer          default(1), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
