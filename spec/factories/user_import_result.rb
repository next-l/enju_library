FactoryBot.define do
  factory :user_import_result, class: UserImportResult do
    association :user_import_file
    association :user
  end
end
