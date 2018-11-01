require "rails_helper"

describe "Flower Scraper API" do
  describe "GET /api/v1/flower-scraper?website=<website>" do
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

    it "renders 404 if no csv_file_name present" do
      plant_website = "https://coloradoplants.jeffco.us/parksearch.do?name=11&parkname=Castlewood+Canyon+"

      get "/api/v1/scrapers?website=#{plant_website}"

      expect(response).to have_http_status(404)
    end

    it "renders 404 if no plant_website present" do
      csv_file_name = "Castlewood_Canyon"

      get "/api/v1/scrapers?csv_file_name=#{csv_file_name}"

      expect(response).to have_http_status(404)
    end
  end
end
