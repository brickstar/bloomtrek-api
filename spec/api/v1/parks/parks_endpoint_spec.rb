require 'rails_helper'

describe "Parks API" do
  it "sends a list of parks" do
    create_list(:park, 3)

    get '/api/v1/parks'

    expect(response).to be_successful

    parks = JSON.parse(response.body, symbolize_names: true)
    park = parks.first

    expect(parks.count).to eq(3)
    expect(park).to have_key(:name)
    expect(park).to have_key(:latitude)
    expect(park).to have_key(:longitude)
  end
end
