require "rails_helper"
RSpec.describe ArtistRole, type: :model do
  describe "#display_name" do
    it "returns the role name" do
      role = described_class.new(name: "composer")

      expect(role.display_name).to eq("composer")
    end
  end
  describe "people" do
    it "can be exercised by several people" do
      role = described_class.new(name: "composer")

      bach = Person.new(
        preferred_given_name: "Johann Sebastian",
        preferred_family_name: "Bach"
      )

      mozart = Person.new(
        preferred_given_name: "Wolfgang Amadeus",
        preferred_family_name: "Mozart"
      )

      role.people << bach
      role.people << mozart

      expect(role.people).to contain_exactly(bach, mozart)
    end
  end
end
