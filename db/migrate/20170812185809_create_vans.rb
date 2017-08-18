class CreateVans < ActiveRecord::Migration[5.1]
  def change
    create_table :vans do |t|
      t.belongs_to :train
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :seats
      t.integer :number
      t.string :type
      t.timestamps
    end
  end
end
