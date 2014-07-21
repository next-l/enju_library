class RequestType < ActiveRecord::Base
  include MasterModel
  default_scope {order('request_types.position')}
end

# == Schema Information
#
# Table name: request_types
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  display_name :text
#  note         :text
#  position     :integer
#  created_at   :datetime
#  updated_at   :datetime
#
