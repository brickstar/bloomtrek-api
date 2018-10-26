require 'pry'
require 'csv'

data =  [
          [
            "http://extension.colostate.edu/county/jeffco/natural/plant_images/adenolinum_lewisii_1_378x400.jpg",
            "WILD BLUE FLAX",
            "blue flax",
            "Adenolinum lewisii",
            "stigma capitate (headed); plant produces many branches from the base; styles of same length on different plants.",
            "May",
            "Aug",
            "dry slopes, forest clearings, roadsides."
          ],
          [
            "http://extension.colostate.edu/county/jeffco/natural/plant_images/amerosedum_lanceolatum_400x267.jpg",
            "YELLOW STONECROP",
            "lanceleaf stonecrop",
            "Amerosedum lanceolatum",
            "leaves succulent (fleshy), in basal (at the plant base) clusters, often deciduous (falling off, not persistent throughout the year) before anthesis (opening of the flower).",
            "Jun",
            "Jul",
            "rocky ground at 5,000 to 11,500 feet elevation."
          ]
        ]

class CSVWriter
  attr_reader :data
  def initialize(arrays)
    @data = arrays
  end

  def generate_csv(data)
    CSV.open("myfile.csv", "w") do |csv|
      csv << ["flower_img_url", "name", "common_name", "scientific_name", "description", "bloom_start", "bloom_end", "habitat"]
      data.each do |ary|
        csv << [ary[0], ary[1], ary[2], ary[3], ary[4], ary[5], ary[6], ary[7], ary[8]]
      end
    end
  end
end

writer = CSVWriter.new(data)
writer.generate_csv(data)
