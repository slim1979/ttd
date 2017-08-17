class CreateVanKind < ActiveRecord::Migration[5.1]
  def change
    if VanKind.count < 4
      VanKind.create van_kind: 'Плацкартный'
      VanKind.create van_kind: 'Купейный'
      VanKind.create van_kind: 'Спальный'
      VanKind.create van_kind: 'Сидячий'
    end
  end
end
