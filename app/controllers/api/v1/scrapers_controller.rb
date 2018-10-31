class Api::V1::ScrapersController < ApplicationController
  before_action :validate_scraper_params, only: [:index]
  before_action :set_website, only: [:index]

  def index
    CsvFlowerPresenter.new(@website, params[:csv_file_name]).generate_flower_csv
  end

  private

  def set_website
    @website = params[:website] + "&parkname=" + params[:parkname].gsub(" ", "+")
  end
end
