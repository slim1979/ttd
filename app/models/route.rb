class Route < ApplicationRecord
  validates :title, presence: true
  has_and_belongs_to_many :railway_stations
end
