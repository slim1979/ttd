class AddRailwayStationIdToTrain < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :trains, :railway_station
  end
end
