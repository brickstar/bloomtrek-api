FactoryBot.define do
  factory :flower do
    name { "WILD BLUE FLAX" }
    common_name { "blue flax" }
    scientific_name { "Adenolinum lewisii" }
    flower_img_url  { "http://extension.colostate.edu/county/jeffco/natural/plant_images/adenolinum_lewisii_1_378x400.jpg" }
    description  { "stigma capitate (headed); plant produces many branches from the base; styles of same length on different plants." }
    bloom_start { 5 }
    bloom_end { 8 }
    habitat { "dry slopes, forest clearings, roadsides." }
  end
end
