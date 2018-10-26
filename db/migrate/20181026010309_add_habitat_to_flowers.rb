class AddHabitatToFlowers < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :habitat, :string
  end
end
