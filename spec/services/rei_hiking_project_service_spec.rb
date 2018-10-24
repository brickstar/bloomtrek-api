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

          trail = trails[:trails].first

          expect(trails).to have_key(:trails)
          expect(trail).to have_key(:id)
          expect(trail).to have_key(:url)
          expect(trail).to have_key(:difficulty)
          expect(trail).to have_key(:length)
          expect(trail).to have_key(:conditionStatus)
          expect(trail).to have_key(:imgMedium)
          expect(trail).to have_key(:summary)
          expect(trail).to have_key(:latitude)
          expect(trail).to have_key(:longitude)
          expect(trail).to have_key(:name)
        end
      end
    end
  end
end
