class CreateSeatsKinds < ActiveRecord::Migration[5.1]
  def change
    create_table :seats_kinds do |t|
      t.string :title
      t.string :seats_type
    end
  end
end
