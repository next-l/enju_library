class EnjuLibrary::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :file, :type => :string, :default => "all"

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_library")
    return if file == 'fixture'
    inject_into_file 'app/controllers/application_controller.rb',
      "  EnjuLibrary::Controller\n", after: "EnjuLeaf::Controller\n"
  end
end
