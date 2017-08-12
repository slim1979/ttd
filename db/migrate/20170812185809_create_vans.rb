class CreateVans < ActiveRecord::Migration[5.1]
  def change
    create_table :vans do |t|
      t.string      :kind
      t.integer     :up_seats
      t.integer     :down_seats
      t.belongs_to  :train
      t.timestamps
    end
  end
end
