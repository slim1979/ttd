class CreateSedentaryVans < ActiveRecord::Migration[5.1]
  def change
    create_table :sedentary_vans do |t|
      t.timestamps
    end
  end
end
