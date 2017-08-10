class RemoveColumnFromRailwayStations < ActiveRecord::Migration[5.1]
  def change
    remove_column :railway_stations, :routes_id
  end
end
