class AddNameToFlowers < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :name, :string
  end
end
