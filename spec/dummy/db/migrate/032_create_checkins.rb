class CreateCheckins < ActiveRecord::Migration[5.2]
  def change
    create_table :checkins do |t|
      t.references :item, foreign_key: true, null: false
      t.references :librarian, foreign_key: {to_table: :users}
      t.references :basket
      t.timestamps
    end
  end
end
