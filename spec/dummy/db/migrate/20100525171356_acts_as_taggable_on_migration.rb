class ActsAsTaggableOnMigration < ActiveRecord::Migration[5.2]
  def self.up
    create_table :tags do |t|
      t.string :name
      t.string :name_transcription
      t.timestamps
    end

    create_table :taggings do |t|
      t.references :tag

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.references :taggable, polymorphic: true
      t.references :tagger, polymorphic: true

      t.string :context

      t.datetime :created_at
    end

    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end

  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
