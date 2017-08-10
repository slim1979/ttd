class CreateRailwayStationsTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :railway_stations_trains do |t|
      t.integer :railway_station_id
      t.integer :train_id
    end
  end
end
