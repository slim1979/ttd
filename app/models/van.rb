class Van < ApplicationRecord
  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }
  before_save :set_number

  def seats_kind
    van_seats = { 'SedentaryVan' => %i[seats],
                  'PlatzVan'      => %i[top_seats bottom_seats side_top_seats side_bottom_seats],
                  'CoupeVan'      => %i[top_seats bottom_seats],
                  'SleepingVan'   => %i[bottom_seats] }
    van_seats[type]
  end

  def show_seats(key)
    places = { top_seats: 'Верхних', bottom_seats: 'Нижних', side_top_seats: 'Верхних боковых',
                side_bottom_seats: 'Нижних боковых', seats: 'Сидячих' }
    places[key]
  end

  def show_self_type
    type = { CoupeVan: 'Купейный', PlatzVan: 'Плацкартный', SleepingVan: 'Спальный', SedentaryVan: 'Сидячий' }
    type[self.type.to_sym]
  end

  private

  def set_number
    self.number ||= 1 if train.vans.count.zero?
    self.number ||= train.vans.last.number + 1 unless train.vans.count.zero?
  end

  def set_seats
    seats_kind.each do |seats|
      send("#{seats}=",0) if self.new_record?
    end
  end
end
