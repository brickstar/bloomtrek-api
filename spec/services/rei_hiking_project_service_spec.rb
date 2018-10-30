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

          park_1 = Park.new(name:"Castlewood Canyon", latitude: 39.3379, longitude: -104.7512)

          trails[:trails].each do |trail|
            park_1.trails.from_api(trail)
          end

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
    describe '#get_trails_by_id' do
      it "returns all trails by id" do
        VCR.use_cassette("rei_hiking_project_service_get_trails_by_id") do
          uids = "7012904,7011142,7055272,7006829,7024419,7010867,7003096,7006771,7027384,7003101"
          rhps = ReiHikingProjectService.new

          trails = rhps.get_trails_by_id(uids)[:trails]

          expect(trails).to be_a(Array)
          expect(trails.length).to eq(10)
          expect(trails.first).to have_key(:conditionStatus)
        end
      end
    end
  end
end
