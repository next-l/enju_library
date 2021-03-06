module EnjuLibrary
  module EnjuProfile
    extend ActiveSupport::Concern

    included do
      belongs_to :library
      belongs_to :user_group
      validates :locale, presence: true
      before_save :set_expired_at
    end

    # ユーザの有効期限を設定します。
    # @return [Time]
    def set_expired_at
      if expired_at.blank?
        if user_group.valid_period_for_new_user > 0
          self.expired_at = user_group.valid_period_for_new_user.days.from_now.end_of_day
        end
      end
    end
  end
end
