require "rails_helper"

describe "Flowers API" do
  before(:each) do
    @park = create(:park)
    @flower1 = create(:flower)
    @flower2 = create(:flower)
    @flower3 = create(:flower)
    ParkFlower.create(park_id: @park.id, flower_id: @flower1.id)
    ParkFlower.create(park_id: @park.id, flower_id: @flower2.id)
  end

  describe "GET /api/v1/parks/:id/flowers" do
    it "sends flowers if month passed in is between start and end bloom" do
      get "/api/v1/parks/#{@park.id}/flowers", params: { :month => 6 }
      expect(response).to be_successful

      flowers = JSON.parse(response.body, symbolize_names: true)

      expect(flowers).to be_a(Array)
      expect(flowers.length).to eq(2)
      expect(flowers[0]).to have_key(:id)
      expect(flowers[0]).to have_key(:common_name)
      expect(flowers[0]).to have_key(:scientific_name)
      expect(flowers[0]).to have_key(:flower_img_url)
      expect(flowers[0]).to have_key(:description)
      expect(flowers[0]).to have_key(:bloom_start)
      expect(flowers[0]).to have_key(:bloom_end)
      expect(flowers[0]).to have_key(:name)
      expect(flowers[0]).to have_key(:habitat)
    end

    it "does not send flowers if month passed in is NOT between start and end bloom" do
      get "/api/v1/parks/#{@park.id}/flowers", params: { :month => 12 }
      expect(response).to be_successful

      flowers = JSON.parse(response.body, symbolize_names: true)

      expect(flowers.length).to eq(0)
    end

    it "sends a 404 if park is not found for flowers" do
      get "/api/v1/parks/100/flowers"
      expect(response.status).to eq(404)
    end
  end
end
