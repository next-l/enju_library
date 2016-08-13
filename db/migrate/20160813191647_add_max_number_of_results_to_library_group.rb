class AddMaxNumberOfResultsToLibraryGroup < ActiveRecord::Migration
  def change
    add_column :library_groups, :max_number_of_results, :integer
  end
end
