class CreateVanKinds < ActiveRecord::Migration[5.1]
  def change
    create_table :van_kinds do |t|
      t.string :van_kind
    end
  end
end
