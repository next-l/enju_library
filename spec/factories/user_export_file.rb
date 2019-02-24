FactoryBot.define do
  factory :user_export_file, class: UserExportFile do
    association :user
  end
end
