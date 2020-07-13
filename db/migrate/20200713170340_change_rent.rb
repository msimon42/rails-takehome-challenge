class ChangeRent < ActiveRecord::Migration[6.0]
  def change
    change_column :buildings, :rent_per_floor, :decimal
  end
end
