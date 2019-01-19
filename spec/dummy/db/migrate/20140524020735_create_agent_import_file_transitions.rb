class CreateAgentImportFileTransitions < ActiveRecord::Migration[5.2]
  def change
    create_table :agent_import_file_transitions do |t|
      t.string :to_state
      if ActiveRecord::Base.configurations[Rails.env]["adapter"].try(:match, /mysql/)
        t.text :metadata
      else
        t.jsonb :metadata, default: {}
      end
      t.integer :sort_key
      t.references :agent_import_file
      t.timestamps
    end

    add_index :agent_import_file_transitions, [:sort_key, :agent_import_file_id], unique: true, name: "index_agent_import_file_transitions_on_sort_key_and_file_id"
  end
end
