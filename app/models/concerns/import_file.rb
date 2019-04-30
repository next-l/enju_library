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
  def send_message(mailer)
    sender = User.find(1)
    message = Message.create!(
      recipient: user.username,
      sender: sender,
      body: mailer.body.raw_source,
      subject: mailer.subject
    )
  end
end
