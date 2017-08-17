class Van < ApplicationRecord
  belongs_to :train
  belongs_to :van_kind

  def show_seats
    van_seats = { 'SedentaryVans' => %i[seats],
                  'PlatzVan'      => %i[top_seats bottom_seats side_top_seats side_bottom_seats],
                  'CoupeVan'      => %i[top_seats bottom_seats],
                  'SleepingVan'   => %i[bottom_seats] }
    van_seats[type]
  end
end
