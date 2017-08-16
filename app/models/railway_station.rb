class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def add_index_on(route, index)
    station = RailwayStationsRoute.where(railway_station: self, route: route).first
    station.railway_station_index = index
    station.save
  end

  def show_index_on(route)
    station = RailwayStationsRoute.where(railway_station: self, route: route).first
    station.railway_station_index
  end
end
