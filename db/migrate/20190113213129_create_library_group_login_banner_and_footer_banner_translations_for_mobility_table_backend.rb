class CreateLibraryGroupLoginBannerAndFooterBannerTranslationsForMobilityTableBackend < ActiveRecord::Migration[5.2]
  def change
    create_table :library_group_translations do |t|

      # Translated attribute(s)
      t.text :login_banner
      t.text :footer_banner

      t.string  :locale, null: false
      t.references :library_group, null: false, foreign_key: true, index: false

      t.timestamps null: false
    end

    add_index :library_group_translations, :locale, name: :index_library_group_translations_on_locale
    add_index :library_group_translations, [:library_group_id, :locale], name: :index_6a2d1f44f9116e652d8a4c6abc8be9dd34bc1a61, unique: true

  end
end
