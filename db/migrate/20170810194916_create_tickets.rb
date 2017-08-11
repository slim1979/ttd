class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :train
      t.integer :start_station
      t.integer :finish_station
      t.timestamps
    end
  end
end
