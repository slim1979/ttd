class ChangeTicketsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :train
    add_column :tickets, :train_id, :integer

    remove_column :tickets, :start_station
    add_column :tickets, :start_station_id, :integer

    remove_column :tickets, :finish_station
    add_column :tickets, :finish_station_id, :integer
  end
end
