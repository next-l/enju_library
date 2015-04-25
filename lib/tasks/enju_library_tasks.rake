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
      library_group = LibraryGroup.find(1)
      library_group.settings[:skip_mobile_agents] = ''
      library_group.settings[:max_number_of_results] = 500
      library_group.settings[:family_name_first] = true
      library_group.save!
    end
    puts 'enju_library: The upgrade completed successfully.'
  end
end
