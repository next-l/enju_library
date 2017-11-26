class AddUserIdToLibraryGroup < ActiveRecord::Migration[5.1]
  def change
    add_reference :library_groups, :user, foreign_key: true, null: false
  end
end
