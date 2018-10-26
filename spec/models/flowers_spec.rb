require "rails_helper"

RSpec.describe Flower, type: :model do
  context "validations" do
    it { should validate_presence_of(:common_name) }
    it { should validate_presence_of(:scientific_name) }
    it { should validate_presence_of(:flower_img_url) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:bloom_start) }
    it { should validate_presence_of(:bloom_end) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:habitat) }
  end

  describe "relationships" do
    it { should have_many(:park_flowers) }
    it { should have_many(:parks).through(:park_flowers) }
  end
end
