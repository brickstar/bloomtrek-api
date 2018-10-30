class Api::V1::ScrapersController < ApplicationController
  before_action :set_website, only: [:index]
  before_action :validate_scrapper_params, only: [:index]

  def index
    response = Faraday.get("https://bloomtrek-api-scraper.herokuapp.com/api/v1/scraper?website=#{@website}")
    flowers = JSON.parse(response.body)
    writer = CsvWriter.new(params[:csv_file_name])
    binding.pry
    writer.write_csv(flowers)
  end

  private

  def set_website
    @website = params[:website] + "&parkname=" + params[:parkname].gsub(" ", "+")
  end
end
