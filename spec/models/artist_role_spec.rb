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

  describe "validations" do
    it "requires a name" do
      role = described_class.new(name: nil)

      expect(role).not_to be_valid
      expect(role.errors[:name]).to include("can't be blank")
    end

    it "requires a unique name" do
      described_class.create!(
        name: "composer"
      )

      duplicate = described_class.new(
        name: "composer"
      )

      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:name]).to include("has already been taken")
    end
  end
end
