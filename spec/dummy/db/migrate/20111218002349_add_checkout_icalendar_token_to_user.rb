class AddCheckoutIcalendarTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :checkout_icalendar_token, :string
    add_index :users, :checkout_icalendar_token, unique: true
  end
end
