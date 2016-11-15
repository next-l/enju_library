class UserImportResult < ActiveRecord::Base
  scope :file_id, proc{ |file_id| where(user_import_file_id: file_id) }
  scope :failed, -> { where(user_id: nil) }

  belongs_to :user_import_file
  belongs_to :user
end

# == Schema Information
#
# Table name: user_import_results
#
#  id                  :integer          not null, primary key
#  user_import_file_id :integer
#  user_id             :integer
#  body                :text
#  created_at          :datetime
#  updated_at          :datetime
#
