class AddProfileIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :profile, foreign_key: {on_delete: :nullify}, type: :uuid
  end
end
