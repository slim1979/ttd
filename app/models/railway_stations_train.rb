class RailwayStationsTrain < ApplicationRecord
  belongs_to :railway_station
  belongs_to :train
end
