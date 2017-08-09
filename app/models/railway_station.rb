class RailwayStation < ApplicationRecord
  validates :title, presence: true
  has_many :trains
  has_and_belongs_to_many :routes
end
