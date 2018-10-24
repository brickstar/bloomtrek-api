require "rails_helper"

describe ReiHikingProjectService do
  describe "instance methods" do
    describe "#trails" do
      it "returns all trails within a certain distance from state park" do
        VCR.use_cassette("rei_hiking_project_service_trails") do
          rhps = ReiHikingProjectService.new
          latitude = 39.3379
          longitude = -104.7512

          trails = rhps.trails(latitude, longitude)
          trail = trails.first

          expect(trail).to have_key(:trails)
          expect(trail[:trails]).to have_key(:id)
          expect(trail[:trails]).to have_key(:difficulty)
          expect(trail[:trails]).to have_key(:length)
          expect(trail[:trails]).to have_key(:status)
          expect(trail[:trails]).to have_key(:imgMedium)
          expect(trail[:trails]).to have_key(:summary)
          expect(trail[:trails]).to have_key(:latitude)
          expect(trail[:trails]).to have_key(:longitude)
        end
      end
    end
  end
end
