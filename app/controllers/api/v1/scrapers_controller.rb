class Api::V1::ScrapersController < ApplicationController
  before_action :set_website, only: [:index]

  def index
    response = Faraday.get("https://bloomtrek-api-scraper.herokuapp.com/api/v1/scraper?website=#{@website}")
    flowers = JSON.parse(response.body)
    binding.pry



  end

  private

  def set_website
    @website = params[:website] + "&parkname=" + params[:parkname].gsub(" ", "+")
  end
end
