module EnjuLibrary
  module EnjuUser
    extend ActiveSupport::Concern

    included do
      include EnjuSeed::EnjuUser
      has_many :basket, dependent: :destroy

      def self.csv_header(role: 'Librarian')
        User.new.to_hash(role: 'Librarian').keys
      end

      # ユーザの情報をエクスポートします。
      # @param [Hash] options
      def to_hash(role: 'Librarian')
        record = {
          username: username,
          full_name: profile.try(:full_name),
          full_name_transcription: profile.try(:full_name_transcription),
          email: email,
          user_number: profile.try(:user_number),
          role: send(:role).try(:name),
          user_group: profile.try(:user_group).try(:name),
          library: profile.try(:library).try(:name),
          locale: profile.try(:locale),
          locked: access_locked?,
          required_role: profile.try(:required_role).try(:name),
          created_at: created_at,
          updated_at: updated_at,
          expired_at: profile.try(:expired_at),
          keyword_list: profile.try(:keyword_list),
          note: profile.try(:note)
        }

        if defined?(EnjuCirculation)
          record.merge!(
            checkout_icalendar_token: profile.checkout_icalendar_token,
            save_checkout_history: profile.save_checkout_history
          )
        end

        if defined?(EnjuSearchLog)
          record.merge!(
            save_search_history: profile.save_checkout_history
          )
        end

        if defined?(EnjuBookmark)
          record.merge!(
            share_bookmarks: profile.share_bookmarks
          )
        end

        record
      end

      def self.export(role: 'Librarian', col_sep: "\t")
        file = Tempfile.create do |f|
          f.write User.csv_header(role: role).to_csv(col_sep: col_sep)
          User.find_each do |user|
            f.write user.to_hash(role: role).values.to_csv(col_sep: col_sep)
          end

          f.rewind
          f.read
        end

        file
      end
    end
  end
end
