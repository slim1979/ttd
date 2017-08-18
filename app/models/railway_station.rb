class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def station(route)
    RailwayStationsRoute.where(railway_station: self, route: route).first
  end

  def set_index_on(route, index)
    station = station(route)
    station.railway_station_index = index
    station.save if index.is_a? Integer
    raise ArgumentError, 'Индекс не может быть строкой' unless index.is_a? Integer
  end

  def show_index_on(route)
    station = station(route)
    station.railway_station_index
  end
end
