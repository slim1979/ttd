class AddVanKind < ActiveRecord::Migration[5.1]
  def change
    VanKind.create title: 'Плацкартный'
    VanKind.create title: 'Купейный'
  end
end
