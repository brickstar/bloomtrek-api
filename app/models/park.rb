class Park
 validates_presence_of :name, :latitude, :longitude

 has_many :park_flowers
 has_many :flowers, through: :park_flowers
end
