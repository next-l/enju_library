class CreateAgentImportFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :agent_import_files, comment: '人物情報インポートファイル' do |t|
      t.references :user, foreign_key: true, comment: 'アップロードユーザ'
      t.text :note, comment: '備考'
      t.datetime :executed_at
      t.string :agent_import_file_name
      t.string :agent_import_content_type
      t.integer :agent_import_file_size
      t.datetime :agent_import_updated_at

      t.timestamps
    end
  end
end
