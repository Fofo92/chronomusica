require "rails_helper"

RSpec.describe ParentChildRelationship, type: :model do
  describe "associations" do
    it "links a parent to a child" do
      parent = Person.new(
        preferred_given_name: "Leopold",
        preferred_family_name: "Mozart"
      )

      child = Person.new(
        preferred_given_name: "Wolfgang Amadeus",
        preferred_family_name: "Mozart"
      )

      relationship = described_class.new(
        parent: parent,
        child: child
      )

      expect(relationship.parent).to eq(parent)
      expect(relationship.child).to eq(child)
    end
  end

  describe "validations" do
    it "does not allow a person to be their own parent" do
      person = Person.new(
        preferred_given_name: "Leopold",
        preferred_family_name: "Mozart"
      )

      relationship = described_class.new(
        parent: person,
        child: person
      )

      expect(relationship).not_to be_valid
      expect(relationship.errors[:child]).to be_present
    end
  end
end
