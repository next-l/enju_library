class UserImportFileTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  
  belongs_to :user_import_file, inverse_of: :user_import_file_transitions
end

# == Schema Information
#
# Table name: user_import_file_transitions
#
#  id                  :integer          not null, primary key
#  to_state            :string
#  metadata            :jsonb
#  sort_key            :integer
#  user_import_file_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
