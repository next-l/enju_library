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
    library_group = LibraryGroup.site_config
    library_group.email = User.find(1).try(:email)
    footer_ja = <<"EOS"
[Next-L Enju Leaf 1.1.4](https://github.com/next-l/enju_leaf), オープンソース統合図書館システム  
Developed by Kosuke Tanabe and [Project Next-L](http://www.next-l.jp) \| [不具合を報告する](https://github.com/next-l/enju_leaf/issues) \| [マニュアル](https://next-l.github.com/manual/)
EOS
    footer_en = <<"EOS"
[Next-L Enju Leaf 1.1.4](https://github.com/next-l/enju_leaf), an open source integrated library system 
Developed by Kosuke Tanabe and [Project Next-L](http://www.next-l.jp) \| [Report bugs](https://github.com/next-l/enju_leaf/issues) \| [Manual](https://next-l.github.com/manual/)
EOS
    library_group.footer_banner_ja = footer_ja
    library_group.footer_banner_en = footer_en
    library_group.save
    puts 'enju_library: The upgrade completed successfully.'
  end
end
