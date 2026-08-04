require "rails_helper"

RSpec.describe Work, type: :model do
  describe "#display_name" do
    it "returns the preferred work title" do
      work = described_class.new(
        preferred_title: "Don Giovanni"
      )

      expect(work.display_name).to eq("Don Giovanni")
    end
  end

  describe "validations" do
    it "requires a preferred title" do
      work = described_class.new

      expect(work).not_to be_valid
      expect(work.errors[:preferred_title]).to be_present
    end
  end
end
