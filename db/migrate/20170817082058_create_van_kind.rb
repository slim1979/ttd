class CreateVanKind < ActiveRecord::Migration[5.1]
  def change
    if VanKind.count < 4
      VanKind.create title: 'Плацкартный', van_type: 'PlatzVan'
      VanKind.create title: 'Купейный', van_type: 'CoupeVan'
      VanKind.create title: 'Спальный', van_type: 'SleepingVan'
      VanKind.create title: 'Сидячий', van_type: 'SedentaryVan'
    end
  end
end
