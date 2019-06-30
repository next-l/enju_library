class BudgetType < ActiveRecord::Base
  include MasterModel
  validates :name, presence: true, format: { with: /\A[0-9A-Za-z][0-9A-Za-z_\-\s,]*[0-9a-z]\Z/ }
  has_many :items

  private

  def valid_name?
    true
  end
end

# == Schema Information
#
# Table name: budget_types
#
#  id                        :integer          not null, primary key
#  name                      :string
#  display_name              :text
#  note                      :text
#  position                  :integer
#  created_at                :datetime
#  updated_at                :datetime
#  display_name_translations :jsonb            not null
#
