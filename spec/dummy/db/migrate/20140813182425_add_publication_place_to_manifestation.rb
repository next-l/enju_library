class AddPublicationPlaceToManifestation < ActiveRecord::Migration[5.0]
  def change
    add_column :manifestations, :publication_place, :text
  end
end
