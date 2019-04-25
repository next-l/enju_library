class AddManifestationIdToSubject < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :manifestation, foreign_key: true
  end
end
