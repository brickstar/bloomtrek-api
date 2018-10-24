require "rails_helper"

RSpec.describe Parks, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  context "relationships" do
    it { should have_many(:flowers).through(:park_flowers) }
    it { should have_many(:trails) }
  end
end
