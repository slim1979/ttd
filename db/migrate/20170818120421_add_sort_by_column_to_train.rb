class AddSortByColumnToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_by, :string
  end
end
