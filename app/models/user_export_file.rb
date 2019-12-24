class UserExportFile < ApplicationRecord
  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: UserExportFileTransition,
    initial_state: :pending
  ]
  include ExportFile

  if ENV['ENJU_STORAGE'] == 's3'
    has_attached_file :user_export, storage: :s3,
      s3_credentials: {
        access_key: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket: ENV['S3_BUCKET_NAME'],
        s3_host_name: ENV['S3_HOST_NAME']
      },
      s3_permissions: :private
  else
    has_attached_file :user_export,
      path: ":rails_root/private/system/:class/:attachment/:id_partition/:style/:filename"
  end
  validates_attachment_content_type :user_export, content_type: /\Atext\/plain\Z/

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
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  user_export_file_name    :string
#  user_export_content_type :string
#  user_export_file_size    :bigint
#  user_export_updated_at   :datetime
#  executed_at              :datetime
#  created_at               :datetime
#  updated_at               :datetime
#
