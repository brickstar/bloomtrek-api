class Park < ApplicationRecord
 validates_presence_of :name, :latitude, :longitude

 has_many :trails
 has_many :park_flowers
 has_many :flowers, through: :park_flowers
end
