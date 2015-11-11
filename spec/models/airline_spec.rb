require "rails_helper"

RSpec.describe Airline, type: :model do
  describe Airline do
    it "does not create without a name" do
      FactoryGirl.build(:invalid_airline).should_not be_valid
    end
    it "creates with a name" do
      FactoryGirl.build(:airline).should be_valid
    end
    it "has one after creating one" do
      FactoryGirl.create(:airline)
      Airline.count.should == 1
    end
  end
  describe "Airlines relationship with flights" do
    it "should have flights associated with it" do
      airline = FactoryGirl.create(:airline)
      expect(airline.flights).not_to be nil
    end
  end
end
