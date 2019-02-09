module ImportFile
  extend ActiveSupport::Concern

  # 失敗したインポート処理を一括削除します。
  def self.expire
    self.stucked.find_each do |file|
      file.destroy
    end
  end

  def import_start
    case edit_mode
    when 'create'
      import
    when 'update'
      modify
    when 'destroy'
      remove
    else
      import
    end
  end

  # インポート完了時のメッセージを送信します。
  def send_message
    sender = User.find(1)
    locale = user.profile.try(:locale) || I18n.default_locale.to_s
    message_template = MessageTemplate.localized_template('import_completed', locale)
    request = MessageRequest.new
    request.assign_attributes({sender: sender, receiver: user, message_template: message_template})
    request.save_message_body
    request.transition_to!(:sent)
  end
end
