require 'csv'

class CsvWriter
  def initialize(filename)
    @filename  = filename
  end

  def write_csv(data, filename = "./db/data/#{@filename}_flowers.csv")
    CSV.open(filename, "w") do |csv|
    csv << ["flower_img_url", "name", "common_name", "scientific_name", "description", "bloom_start", "bloom_end", "habitat"]
    data.each do |ary|
      csv << [ary[0], ary[1], ary[2], ary[3], ary[4], ary[5], ary[6], ary[7]]
      end
    end
  end
end
