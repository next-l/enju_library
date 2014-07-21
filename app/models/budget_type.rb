class BudgetType < ActiveRecord::Base
  include MasterModel
  default_scope {order('budget_types.position')}
  has_many :items
end

# == Schema Information
#
# Table name: budget_types
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  display_name :text
#  note         :text
#  position     :integer
#  created_at   :datetime
#  updated_at   :datetime
#
