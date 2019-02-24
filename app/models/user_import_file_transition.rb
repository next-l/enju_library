class UserImportFileTransition < ActiveRecord::Base

  
  belongs_to :user_import_file, inverse_of: :user_import_file_transitions
end

# == Schema Information
#
# Table name: user_import_file_transitions
#
#  id                  :bigint(8)        not null, primary key
#  to_state            :string
#  metadata            :jsonb
#  sort_key            :integer
#  user_import_file_id :uuid
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  most_recent         :boolean          not null
#
