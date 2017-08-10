class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :railway_stations_trains
  has_many :trains, through: :railway_stations_trains
  has_and_belongs_to_many :routes
end
