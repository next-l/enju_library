class UserExportFile < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  include ExportFile
  has_one_attached :attachment

  has_many :user_export_file_transitions

  def state_machine
    UserExportFileStateMachine.new(self, transition_class: UserExportFileTransition)
  end

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
    to: :state_machine

  # エクスポートの処理を実行します。
  def export!
    transition_to!(:started)
    tempfile = Tempfile.new(['user_export_file_', '.txt'])
    file = User.export(format: :txt)
    tempfile.puts(file)
    tempfile.close
    self.user_export = File.new(tempfile.path, 'r')
    if save
      send_message
    end
    transition_to!(:completed)
  rescue => e
    transition_to!(:failed)
    raise e
  end

  def self.transition_class
    UserExportFileTransition
  end

  def self.initial_state
    :pending
  end
end

# == Schema Information
#
# Table name: user_export_files
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  executed_at     :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  attachment_data :jsonb
#
