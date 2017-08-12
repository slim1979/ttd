class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :train
      t.belongs_to :start_station
      t.belongs_to :finish_station
      t.belongs_to :user
    end
  end
end
