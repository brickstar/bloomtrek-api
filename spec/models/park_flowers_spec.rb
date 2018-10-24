require "rails_helper"

RSpec.describe ParkFlower, type: :model do
  context "relationships" do
    it { should belong_to(:flower) }
    it { should belong_to(:park) }
  end
end
