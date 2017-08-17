class CreatePlatzVans < ActiveRecord::Migration[5.1]
  def change
    create_table :platz_vans do |t|
      t.timestamps
    end
  end
end
