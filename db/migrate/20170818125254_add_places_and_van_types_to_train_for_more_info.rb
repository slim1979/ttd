class AddPlacesAndVanTypesToTrainForMoreInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :van_type_to_more_info, :string
    add_column :trains, :places_type_to_more_info, :string
  end
end
