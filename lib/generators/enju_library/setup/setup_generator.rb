class EnjuLibrary::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :file, :type => :string, :default => "all"

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_library")
    return if file == 'fixture'
    inject_into_class 'app/controllers/application_controller.rb', ApplicationController,
      "  include EnjuLibrary::Controller\n"
    append_to_file("app/models/user.rb", "Item.include(EnjuLibrary::EnjuItem)\n")
    gsub_file 'app/models/user.rb', /, :validatable$/, <<EOS
, # :validatable,
      :lockable, lock_strategy: :none, unlock_strategy: :none
  include EnjuSeed::EnjuUser
EOS
  end
end
