require "rails_helper"

RSpec.describe WorkContribution, type: :model do
  describe "associations" do
    it "links a person to a work" do
      person = Person.new(
        preferred_given_name: "Wolfgang Amadeus",
        preferred_family_name: "Mozart"
      )
      work = Work.new(preferred_title: "Don Giovanni")

      contribution = described_class.new(
        person: person,
        work: work,
        contribution_role: "composer"
      )

      expect(contribution.person).to eq(person)
      expect(contribution.work).to eq(work)
    end
  end

  describe "validations" do
    it "requires a contribution role" do
      contribution = described_class.new(
        person: Person.new(
          preferred_given_name: "Wolfgang Amadeus",
          preferred_family_name: "Mozart"
        ),
        work: Work.new(preferred_title: "Don Giovanni")
      )

      expect(contribution).not_to be_valid
      expect(contribution.errors[:contribution_role]).to be_present
    end
  end
end
