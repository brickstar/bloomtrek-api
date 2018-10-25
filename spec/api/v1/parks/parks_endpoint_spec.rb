require 'rails_helper'

describe "Parks API" do
  before(:each) do
    @parks = create_list(:park, 3)
    @park = @parks.first
  end

  it "sends a list of parks" do

    get '/api/v1/parks'

    expect(response).to be_successful

    parks = JSON.parse(response.body, symbolize_names: true)
    park = parks.first

    expect(parks.count).to eq(3)
    expect(park).to have_key(:name)
    expect(park).to have_key(:latitude)
    expect(park).to have_key(:longitude)
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
    # expect(park[0][:trails].count).to eq(3)
  end
end

# [
#       {
#          name: "name",
#          uid: "uid"
#          difficulty: "difficulty"
#          length: "length"
#          status: "status"
#          trail_img_url: "trail_img_url"
#          trail_url: "trail_url"
#          summary: "summary"
#          latitude: "latitude"
#          longitude: "longitude"
#    }
# ]
