class CreateEventCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :event_categories do |t|
      t.string :name, null: false
      t.text :note
      t.integer :position

      t.timestamps
    end
  end
end
