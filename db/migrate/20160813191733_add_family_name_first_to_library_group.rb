class AddFamilyNameFirstToLibraryGroup < ActiveRecord::Migration
  def change
    add_column :library_groups, :family_name_first, :boolean
  end
end
