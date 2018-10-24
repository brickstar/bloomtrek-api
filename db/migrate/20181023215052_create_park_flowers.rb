class CreateParkFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :park_flowers do |t|
      t.references :park, foreign_key: true
      t.references :flower, foreign_key: true
    end
  end
end
