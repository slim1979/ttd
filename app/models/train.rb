class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :vans

  validates :number, presence: true
  before_save :set_sort_by

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

  def set_sort_by
    self.sort_by = 'asc' if new_record?
  end

  def sort_vans
    vans.order(number: sort_by.to_sym)
  end

  # vans collection with uniq values to collection select
  # in show template
  def vans_collection
    collection = []
    vans.map(&:type).uniq.each { |type| collection << [type.to_sym, Van::TYPE[type.to_sym]] }
    collection
  end

  # returns amount of requirement seats
  def adv_info
    seats = places_type_to_more_info.to_sym if places_type_to_more_info
    van = van_type_to_more_info.to_sym if van_type_to_more_info
    van_seats = vans.where(type: van).map(&seats)
    type_mismatch = van_seats.include? nil
<<<<<<< HEAD
    if type_mismatch
      'В вагоне этого типа нет таких мест'
    else
      van_seats.sum
    end
=======
    'В вагоне этого типа нет таких мест' if type_mismatch
    van_seats.sum unless type_mismatch
>>>>>>> c8c78988800228a0fa34ff9e1942264171455213
  end
end
