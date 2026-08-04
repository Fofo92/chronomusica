require "rails_helper"

RSpec.describe PersonPlaceAssociation, type: :model do
  describe "associations" do
    it "links a person to a place" do
      person = Person.new(
        preferred_given_name: "Isaac",
        preferred_family_name: "Albéniz"
      )
      place = Place.new(preferred_name: "Camprodon")

      association = described_class.new(
        person: person,
        place: place,
        association_type: "birth"
      )

      expect(association.person).to eq(person)
      expect(association.place).to eq(place)
    end
  end

  describe "validations" do
    it "requires an association type" do
      association = described_class.new(
        person: Person.new(
          preferred_given_name: "Isaac",
          preferred_family_name: "Albéniz"
        ),
        place: Place.new(preferred_name: "Camprodon")
      )

      expect(association).not_to be_valid
      expect(association.errors[:association_type]).to be_present
    end
  end
end
