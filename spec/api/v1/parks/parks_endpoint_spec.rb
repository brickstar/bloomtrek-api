require 'rails_helper'

describe "Parks API" do
  before(:each) do
    @parks = create_list(:park, 3)
    @park = @parks.first
  end

  describe "GET /api/v1/parks" do
    it "sends a list of parks" do
      get '/api/v1/parks'
      expect(response).to be_successful

      parks = JSON.parse(response.body, symbolize_names: true)
      park = parks.first

      expect(parks.count).to eq(3)
      expect(park).to have_key(:name)
      expect(park).to have_key(:coords)
      expect(park[:coords]).to have_key(:latitude)
      expect(park[:coords]).to have_key(:longitude)
    end
  end
end
