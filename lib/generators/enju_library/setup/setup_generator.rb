class EnjuLibrary::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_setup_files
    directory("db/fixtures", "db/fixtures/enju_library")
    rake("enju_library_engine:install:migrations")
    inject_into_class 'app/models/item.rb', Item,
      "  enju_library_item_model\n"
  end
end
