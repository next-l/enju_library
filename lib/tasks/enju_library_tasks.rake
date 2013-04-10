require 'active_record/fixtures'
desc "create initial records for enju_library"
namespace :enju_library do
  task :setup => :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_library/*.yml').each do |file|
      ActiveRecord::Fixtures.create_fixtures('db/fixtures/enju_library', File.basename(file, '.*'))
    end
  end
end
