require "rails_helper"

describe "Trails API" do
  before(:each) do
    @park = create(:park)
    @trail1 = create(:trail, park_id: @park.id, difficulty: "green")
    @trail2 = create(:trail, park_id: @park.id, difficulty: "black")
    @trail3 = create(:trail, park_id: @park.id)
  end

  describe "GET /api/v1/parks/:id/trails" do
    it "returns trails associated with park id" do
      get "/api/v1/parks/#{@park.id}/trails"
      expect(response).to be_successful

      park = JSON.parse(response.body, symbolize_names: true)

      expect(park[0]).to have_key(:name)
      expect(park[0]).to have_key(:uid)
      expect(park[0]).to have_key(:difficulty)
      expect(park[0]).to have_key(:length)
      expect(park[0]).to have_key(:status)
      expect(park[0]).to have_key(:trail_img_url)
      expect(park[0]).to have_key(:trail_url)
      expect(park[0]).to have_key(:summary)
      expect(park[0]).to have_key(:coords)
      expect(park[0][:coords]).to have_key(:latitude)
      expect(park[0][:coords]).to have_key(:longitude)
      expect(park.count).to eq(3)
    end

    it "sends a 404 if park is not found for trails" do
      get "/api/v1/parks/100/trails"
      expect(response.status).to eq(404)
    end
  end
end
