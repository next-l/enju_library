class AddUserGroupIdToProfile < ActiveRecord::Migration[5.2]
  def change
    add_references :profiles, :user_group, foreign_key: true
    add_references :profiles, :library, foreign_key: true
  end
end
