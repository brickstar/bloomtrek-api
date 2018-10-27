class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :common_name
      t.string :scientific_name
      t.string :flower_img_url
      t.string :description
      t.integer :bloom_start
      t.integer :bloom_end
    end
  end
end
