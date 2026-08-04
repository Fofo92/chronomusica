require "rails_helper"
RSpec.describe Place, type: :model do
  describe "#display_name" do
    it "returns the preferred place name" do
      place = described_class.new(
        preferred_name: "Venise"
      )

      expect(place.display_name).to eq("Venise")
    end
  end

  describe "validations" do
    it "requires a preferred name" do
      place = described_class.new

      expect(place).not_to be_valid
      expect(place.errors[:preferred_name]).to be_present
    end
  end
end
