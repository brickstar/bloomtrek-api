require 'rails_helper'

describe "Parks API" do
  before(:each) do
    @parks = create_list(:park, 3)
    @park = @parks.first
    @trail1 = create(:trail, park_id: @park.id, difficulty: "green")
    @trail2 = create(:trail, park_id: @park.id, difficulty: "black")
    @trail3 = create(:trail, park_id: @park.id)
    @flower1 = create(:flower)
    @flower2 = create(:flower)
    @flower3 = create(:flower)
    ParkFlower.create(park_id: @park.id, flower_id: @flower1.id)
    ParkFlower.create(park_id: @park.id, flower_id: @flower2.id)
  end

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

  it "sends a single park and its associated trails" do
    get "/api/v1/parks/#{@parks.first.id}/trails"
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
    expect(park[0]).to have_key(:latitude)
    expect(park[0]).to have_key(:longitude)
    expect(park.count).to eq(3)
  end

  it "sends a single park and its associated flowers if month passed in is between start and end bloom" do
    get "/api/v1/parks/#{@parks.first.id}/flowers", params: { :month => 6 }
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
    get "/api/v1/parks/#{@parks.first.id}/flowers", params: { :month => 12 }
    expect(response).to be_successful

    flowers = JSON.parse(response.body, symbolize_names: true)

    expect(flowers.length).to eq(0)
  end

  it "sends a 404 if park is not found for flowers" do
    get "/api/v1/parks/100/flowers"
    expect(response.status).to eq(404)
  end

  it "sends a 404 if park is not found for trails" do
    get "/api/v1/parks/100/trails"
    expect(response.status).to eq(404)
  end
end
