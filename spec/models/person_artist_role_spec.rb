require "rails_helper"

RSpec.describe PersonArtistRole, type: :model do
  describe "associations" do
    it "links a person to an artist role" do
      person = Person.new(
        preferred_given_name: "Johann Sebastian",
        preferred_family_name: "Bach"
      )

      artist_role = ArtistRole.new(
        name: "composer"
      )

      relation = described_class.new(
        person: person,
        artist_role: artist_role
      )

      expect(relation.person).to eq(person)
      expect(relation.artist_role).to eq(artist_role)
    end
  end
end
