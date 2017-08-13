class AddVanKind < ActiveRecord::Migration[5.1]
  def change
    if VanKind.count.zero?
      VanKind.create title: 'Плацкартный'
      VanKind.create title: 'Купейный'
    end
  end
end
