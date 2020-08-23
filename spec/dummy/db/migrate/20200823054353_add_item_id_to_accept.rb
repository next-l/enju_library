class AddItemIdToAccept < ActiveRecord::Migration[5.2]
  def change
    add_reference :accepts, :item, null: false, foreign_key: true
  end
end
