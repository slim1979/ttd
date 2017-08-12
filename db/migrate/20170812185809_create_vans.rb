class CreateVans < ActiveRecord::Migration[5.1]
  def change
    create_table :vans do |t|
      t.string     :kind
      t.belongs_to :train
      t.timestamps
    end
  end
end
