class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_index, uniqueness: { scope: :route }

  scope :increase, -> { order(:railway_station_index) }
  scope :decrease, -> { order(railway_station_index: :desc) }
end
