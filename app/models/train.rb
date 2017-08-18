class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :vans

  validates :number, presence: true

  def platz_vans
    vans.where(van_kind: 1)
  end

  def coupe_vans
    vans.where(van_kind: 2)
  end

  def seats(type, kind)
    all = 0
    send("#{type}_vans").each { |van| all += van.send("#{kind}_seats") }
    all
  end

  def sort_vans
    Van.where(train: self).order(number: self.sort_by.to_sym)
  end
end
