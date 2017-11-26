class AddForeignKeyToLibraryGroupIdOnLibrary < ActiveRecord::Migration
  def change
    add_foreign_key :libraries, :library_group, null: false
  end
end
