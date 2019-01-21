class AddManifestationIdToClassification < ActiveRecord::Migration[5.2]
  def change
    add_reference :classifications, :manifestation, foreign_key: true
  end
end
