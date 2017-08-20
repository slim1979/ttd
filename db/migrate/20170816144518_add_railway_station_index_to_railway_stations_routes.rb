class AddRailwayStationIndexToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :railway_station_index, :integer
  end
end
