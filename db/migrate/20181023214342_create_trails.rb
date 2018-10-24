class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.integer :uid
      t.string :difficulty
      t.float :length
      t.integer :status
      t.string :trail_img_url
      t.string :trail_url
      t.string :summary
      t.float :latitude
      t.float :longitude
      t.references :park, foreign_key: true
    end
  end
end
