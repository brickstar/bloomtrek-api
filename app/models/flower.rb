class Flower < ApplicationRecord
  validates_presence_of :common_name,
                        :scientific_name,
                        :flower_img_url,
                        :description,
                        :bloom_start,
                        :bloom_end,
                        :name,
                        :habitat

  has_many :park_flowers
  has_many :parks, through: :park_flowers
end
