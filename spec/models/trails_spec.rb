require "rails_helper"

RSpec.describe Trail, type: :model do
  context "validations" do
    it { should validate_presence_of(:difficulty) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:trail_img_url) }
    it { should validate_presence_of(:trail_url) }
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:name) }
  end

  context "relationships" do
    it { should belong_to(:park) }
    it { should have_many(:flowers).through(:park) }
  end
end
