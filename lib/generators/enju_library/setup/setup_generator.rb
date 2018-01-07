class EnjuLibrary::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :file, :type => :string, :default => "all"

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_library")
    return if file == 'fixture'
    inject_into_file 'app/controllers/application_controller.rb',
      "  include EnjuLibrary::Controller\n", after: "include EnjuLeaf::Controller\n"
    append_to_file("app/models/user.rb", "Item.include(EnjuLibrary::EnjuItem)\n")
    generate("enju_library:update")
  end
end
