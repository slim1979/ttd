class CreateCoupeVans < ActiveRecord::Migration[5.1]
  def change
    create_table :coupe_vans do |t|
      t.timestamps
    end
  end
end
