class UserExportFile < ApplicationRecord
  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: UserExportFileTransition,
    initial_state: :pending
  ]
  include ExportFile

  has_one_attached :user_export

  has_many :user_export_file_transitions, autosave: false, dependent: :destroy

  def state_machine
    UserExportFileStateMachine.new(self, transition_class: UserExportFileTransition)
  end

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
    to: :state_machine

  # エクスポートの処理を実行します。
  def export!
    UserExportFile.transaction do
      transition_to!(:started)
      role_name = user.try(:role).try(:name)
      tsv = User.export(role: role_name)
      user_export.attach(io: StringIO.new(tsv), filename: "user_export.txt")
      save!
      transition_to!(:completed)
    end

    mailer = UserExportMailer.completed(self)
    send_message(mailer)
  rescue => e
    transition_to!(:failed)
    mailer = UserExportMailer.failed(self)
    raise e
  end
end

# == Schema Information
#
# Table name: user_export_files
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  executed_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
