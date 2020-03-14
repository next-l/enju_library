class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles, comment: '権限' do |t|
      t.string :name, null: false
      t.string :display_name
      t.text :note, comment: '備考'
      t.integer :position

      t.timestamps
    end
  end
end
