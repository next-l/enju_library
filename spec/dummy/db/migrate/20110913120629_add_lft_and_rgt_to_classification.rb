class AddLftAndRgtToClassification < ActiveRecord::Migration[5.2]
  def change
    add_column :classifications, :lft, :integer
    add_column :classifications, :rgt, :integer
  end
end
