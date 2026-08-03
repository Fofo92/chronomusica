require "rails_helper"

RSpec.describe Gedcom::Parser do
  describe ".parse" do
    it "identifies the individuals of the document" do
      document = described_class.parse(
        fixture_file_path("minimal_composers.ged")
      )

      expect(document.individuals.size).to eq(2)
    end
  end
end
