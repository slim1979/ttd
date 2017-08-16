class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_index, uniqueness: { scope: :route }
  before_validation :set_index

  scope :increase, -> { order(:railway_station_index) }
  scope :decrease, -> { order(railway_station_index: :desc) }

  private

  def set_index
    self.railway_station_index ||= self.railway_station_id
  end
end
