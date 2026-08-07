require "rails_helper"
RSpec.describe ArtistRole, type: :model do
  describe "#display_name" do
    it "returns the role name" do
      role = described_class.new(name: "composer")

      expect(role.display_name).to eq("composer")
    end
  end
end
