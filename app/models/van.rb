class Van < ApplicationRecord
  TYPE = { CoupeVan: 'Купейный', PlatzVan: 'Плацкартный',
           SleepingVan: 'Спальный', SedentaryVan: 'Сидячий' }.freeze
  VAN_SEATS_KIND = { 'SedentaryVan' => %i[seats],
<<<<<<< HEAD
                'PlatzVan'      => %i[top_seats bottom_seats side_top_seats side_bottom_seats],
                'CoupeVan'      => %i[top_seats bottom_seats],
                'SleepingVan'   => %i[bottom_seats] }.freeze
  PLACES =  { top_seats: 'Верхних', bottom_seats: 'Нижних', side_top_seats: 'Верхних боковых',
              side_bottom_seats: 'Нижних боковых', seats: 'Сидячих' }
=======
                     'PlatzVan'      => %i[top_seats bottom_seats side_top_seats side_bottom_seats],
                     'CoupeVan'      => %i[top_seats bottom_seats],
                     'SleepingVan'   => %i[bottom_seats] }.freeze
  PLACES = { top_seats: 'Верхних', bottom_seats: 'Нижних', side_top_seats: 'Верхних боковых',
              side_bottom_seats: 'Нижних боковых', seats: 'Сидячих' }.freeze
>>>>>>> 4e8f1431dfee518ba47db15ce0779e44113796a6

  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }
  before_validation :set_seats
  before_save :set_number

  def seats_kind
    VAN_SEATS_KIND[type]
  end

  def show_seats(key)
    PLACES[key]
  end

  def show_self_type
    TYPE[type.to_sym]
  end

  private

  def last_van_number
    train.vans.order(:number).last.number
  end

  def set_number
    self.number ||= 1 if train.vans.count.zero?
    self.number ||= last_van_number + 1 unless train.vans.count.zero?
  end

  def set_seats
    seats_kind.each do |seats|
      send("#{seats}=", 0) if new_record?
    end
  end
end
