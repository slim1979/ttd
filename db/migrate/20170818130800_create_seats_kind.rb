class CreateSeatsKind < ActiveRecord::Migration[5.1]
  def change
    if SeatsKind.count < 5
      SeatsKind.create title: 'Верхние', seats_type: 'top_seats'
      SeatsKind.create title: 'Нижние', seats_type: 'bottom_seats'
      SeatsKind.create title: 'Верхние боковые', seats_type: 'side_top_seats'
      SeatsKind.create title: 'Нижние боковые', seats_type: 'side_bottom_seats'
      SeatsKind.create title: 'Сидячие', seats_type: 'seats'
    end
  end
end
