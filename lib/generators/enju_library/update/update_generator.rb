class EnjuLibrary::UpdateGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  desc "Create files for updating Next-L Enju"

  def copy_statesman_migration_files
    generate('statesman:add_constraints_to_most_recent', 'UserImportFile', 'UserImportFileTransition')
    generate('statesman:add_constraints_to_most_recent', 'UserExportFile', 'UserExportFileTransition')
  end
end
