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
end
