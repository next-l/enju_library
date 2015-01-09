require 'active_record/fixtures'
require 'tasks/color'

desc "create initial records for enju_library"
namespace :enju_library do
  task :setup => :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_library/*.yml').each do |file|
      ActiveRecord::Fixtures.create_fixtures('db/fixtures/enju_library', File.basename(file, '.*'))
    end
  end

  desc "upgrade enju_library"
  task :upgrade => :environment do
    LibraryGroup.transaction do
      update_color
    end
    puts 'enju_library: The upgrade completed successfully.'
  end
end
