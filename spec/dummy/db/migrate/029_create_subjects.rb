class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.references :parent, foreign_key: {to_table: :subjects}
      t.integer :use_term_id, index: true
      t.string :term, index: true
      t.text :term_transcription
      t.references :subject_type, null: false
      t.text :scope_note
      t.text :note
      t.references :required_role, default: 1, null: false
      t.integer :lock_version, default: 0, null: false
      t.timestamps
    end
  end
end
