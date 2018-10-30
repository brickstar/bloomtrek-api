class Api::V1::ScrapersController < ApplicationController
  before_action :validate_scraper_params, only: [:index]
  before_action :set_website, only: [:index]

  def index
    # response = Faraday.get("https://bloomtrek-api-scraper.herokuapp.com/api/v1/scraper?website=#{@website}")
    scraper = ScraperService.new
    flowers = scraper.flowers(@website)
    writer = CsvWriter.new(params[:csv_file_name])
    writer.write_csv(flowers)
  end

  private

  def set_website
    @website = params[:website] + "&parkname=" + params[:parkname].gsub(" ", "+")
  end
end
