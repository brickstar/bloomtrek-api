class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.float :latitude, limit: 30
      t.float :longitude, limit: 30
    end
  end
end
