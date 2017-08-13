class AddVanKindIdToVan < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :vans, :van_kind
  end
end
