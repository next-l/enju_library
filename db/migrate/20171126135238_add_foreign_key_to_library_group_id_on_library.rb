class AddForeignKeyToLibraryGroupIdOnLibrary < ActiveRecord::Migration
  def change
    add_foreign_key :libraries, :library_group_id, null: false
  end
end
