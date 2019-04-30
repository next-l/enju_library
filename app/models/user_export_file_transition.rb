class UserExportFileTransition < ActiveRecord::Base

  
  belongs_to :user_export_file, inverse_of: :user_export_file_transitions
  #attr_accessible :to_state, :sort_key, :metadata
end

# == Schema Information
#
# Table name: user_export_file_transitions
#
#  id                  :bigint           not null, primary key
#  to_state            :string
#  metadata            :jsonb
#  sort_key            :integer
#  user_export_file_id :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  most_recent         :boolean          not null
#
