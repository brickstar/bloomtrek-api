require "rails_helper"

describe "Flower Scraper API" do
  describe "get /api/v1/flower-scraper?website=<website>" do
    it "generates a csv file with the parameter name" do
      VCR.use_cassette("flower_scraper_csv_generator") do
        plant_website = "https://coloradoplants.jeffco.us/parksearch.do?name=11&parkname=Castlewood+Canyon+"
        csv_file_name = "Castlewood_Canyon"

        get "/api/v1/scrapers?csv_file_name=#{csv_file_name}&website=#{plant_website}"

        expected_csv = File.read("./db/data/#{csv_file_name}_flowers.csv")

        expect(response).to be_successful
        expect(expected_csv).to be_a(String)
      end
    end
  end
end
