require "rails_helper"

RSpec.describe Airline, type: :model do
  describe Airline do
    it "does not create without a name" do
      expect(FactoryGirl.build(:invalid_airline)).not_to be_valid
    end
    it "creates with a name" do
      expect(FactoryGirl.build(:airline)).to be_valid
    end
    it "has one after creating one" do
      FactoryGirl.create(:airline)
      expect(Airline.count).to eq 1
    end
  end
  describe "Airlines relationship with flights" do
    it "should have flights associated with it" do
      airline = FactoryGirl.create(:airline)
      expect(airline.flights).not_to be nil
    end
  end
end
