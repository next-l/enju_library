FactoryBot.define do
  factory :user_import_file, class: UserImportFile do
    association :user
    association :default_library, factory: :library
    association :default_user_group, factory: :user_group
  end
end
