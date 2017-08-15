class Route < ApplicationRecord
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true
  validate :stations_count

  before_validation :set_title

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
