class AddDefaultCustomLabelToLibraryGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :library_groups, :default_custom_manifestation_label, :text
    add_column :library_groups, :default_custom_item_label, :text
  end
end
