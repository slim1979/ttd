class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true

  before_validation :set_title

  private

  def set_title
    self.title ||= "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end
end
