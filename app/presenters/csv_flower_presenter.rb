class CsvFlowerPresenter
  def initialize(website, csv_file_name)
    @website = website
    @flower_data= ScraperService.new.flowers(@website)
    @csv_writer = CsvWriter.new(csv_file_name)
  end

  def generate_flower_csv
    @csv_writer.write_csv(@flower_data)
  end
end
