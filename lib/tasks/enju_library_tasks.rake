require 'active_record/fixtures'
require 'tasks/color'

desc "create initial records for enju_library"
namespace :enju_library do
  task :setup => :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_library/**/*.yml').each do |file|
      dirname = File.basename(File.dirname file)
      dirname = nil if dirname == "enju_library"
      basename = [ dirname, File.basename(file, ".*") ].compact
      basename = File.join(*basename)
      ActiveRecord::FixtureSet.create_fixtures('db/fixtures/enju_library', basename)
    end
  end

  desc "upgrade enju_library"
  task :upgrade => :environment do
    Rake::Task['statesman:backfill_most_recent'].invoke('UserExportFile')
    Rake::Task['statesman:backfill_most_recent'].invoke('UserImportFile')
    puts 'enju_library: The upgrade completed successfully.'
  end
end
