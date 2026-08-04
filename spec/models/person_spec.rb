require "rails_helper"

RSpec.describe Person, type: :model do
  describe "#display_name" do
    it "combines the preferred given name and family name" do
      person = described_class.new(
        preferred_given_name: "Isaac",
        preferred_family_name: "Albéniz"
      )

      expect(person.display_name).to eq("Isaac Albéniz")
    end
  end

  describe "#preferred_name" do
    it "returns the preferred identity of a person" do
      person = described_class.new(
        preferred_given_name: "Isaac",
        preferred_family_name: "Albéniz"
      )

      expect(person.preferred_name).to eq("Isaac Albéniz")
    end
  end

  describe "validations" do
    it "requires a preferred given name" do
      person = described_class.new(
        preferred_family_name: "Albéniz"
      )

      expect(person).not_to be_valid
      expect(person.errors[:preferred_given_name]).to be_present
    end

    it "requires a preferred family name" do
      person = described_class.new(
        preferred_given_name: "Isaac"
      )

      expect(person).not_to be_valid
      expect(person.errors[:preferred_family_name]).to be_present
    end
  end

  describe "#birth_date_known?" do
  it "returns true when a birth date is recorded" do
    person = described_class.new(birth_date: Date.new(1860, 5, 29))

    expect(person.birth_date_known?).to be(true)
  end
end
end
