class Route < ApplicationRecord
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true
  validate :stations_count

  before_validation :set_title

  def stations_sorted_to_increase
    RailwayStationsRoute.where(route: self).increase.each do |relation|
      railway_stations.find(relation.railway_station_id).title
    end
  end

  def stations_sorted_to_decrease
    RailwayStationsRoute.where(route: self).decrease.each do |relation|
      railway_stations.find(relation.railway_station_id).title
    end
  end

  private

  def set_title
    self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  rescue NoMethodError
    errors.add(:base, 'Нельзя создать маршрут без станций')
  end

  def stations_count
    errors.add(:base, 'Маршрут должен включать не менее 2-х станций') if railway_stations.size < 2
  end

end
