class CreateSleepingVans < ActiveRecord::Migration[5.1]
  def change
    create_table :sleeping_vans do |t|
      t.timestamps
    end
  end
end
