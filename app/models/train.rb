class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :vans

  validates :number, presence: true

  def coupe_vans
    vans.where(kind: 'Купейный')
  end

  def platz_vans
    vans.where(kind: 'Плацкартный')
  end

  def seats(type, kind)
    all = 0
    send("#{type}_vans").each { |van| all += van.send("#{kind}_seats") }
    all
  end
end
