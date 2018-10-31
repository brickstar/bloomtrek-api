require "rails_helper"

describe ScraperService do
  describe "instance methods" do
    describe "#flowers" do
      it "returns relevant flowers from CSU extension website" do
        VCR.use_cassette("flower_scraper_csv_generator") do
          scraper_service = ScraperService.new
          plant_website = "https://coloradoplants.jeffco.us/parksearch.do?name=11&parkname=Castlewood+Canyon+"

          flowers = scraper_service.flowers(plant_website)
          flower = flowers.first

          expect(flowers).to be_a(Array)
          expect(flower).to be_a(Array)
          expect(flower[0]).to be_a(String)
          expect(flower[1]).to be_a(String)
          expect(flower[2]).to be_a(String)
          expect(flower[3]).to be_a(String)
          expect(flower[4]).to be_a(String)
          expect(flower[5]).to be_a(Integer)
          expect(flower[6]).to be_a(Integer)
          expect(flower[7]).to be_a(String)
          expect(flower.length).to eq(8)
        end
      end
    end
  end
end
