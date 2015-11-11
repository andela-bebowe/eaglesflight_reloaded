require "rails_helper"

RSpec.describe Airport, type: :model do
  describe Airport do
    it "does not create without a name" do
      FactoryGirl.build(:invalid_airport).should_not be_valid
    end
    it "does not create without a location" do
      FactoryGirl.build(:invalid_airport2).should_not be_valid
    end
    it "creates with a name and location" do
      FactoryGirl.build(:airport).should be_valid
      Airport.count.should_not == 0
    end
  end
  describe "Airport relationship with flights" do
    it "should have flights associated with it" do
      a3 = FactoryGirl.create(:airport3)
      a4 = FactoryGirl.create(:airport4)
      expect(a4.to_s).to eq "Krum airport, Krum"
      FactoryGirl.create(:flight)
      expect(a3.landings).not_to be nil
      expect(a4.take_offs).not_to be nil
    end
  end
end
