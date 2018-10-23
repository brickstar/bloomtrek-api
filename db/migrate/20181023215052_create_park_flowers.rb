class CreateParkFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :park_flowers do |t|
      t.references :parks, foreign_key: true
      t.references :flowers, foreign_key: true
    end
  end
end
