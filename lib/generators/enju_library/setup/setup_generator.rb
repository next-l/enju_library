class EnjuLibrary::SetupGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_library")
    rake("enju_library_engine:install:migrations")
end
