require "rails_helper"

RSpec.describe Flight, type: :model do
  describe Flight do
    it "does not create without departure_id/airline_id" do
      expect(FactoryGirl.build(:nil_flight)).not_to be_valid
    end
    it "creates with correct attributes" do
      expect(FactoryGirl.build(:flight)).to be_valid
    end
    it "has one after creating one" do
      FactoryGirl.create(:flight)
      expect(Flight.count).not_to be 0
    end
  end
  describe "Flight relationship with Airport" do
    it "should have destination airport" do
      flight = FactoryGirl.create(:flight)
      FactoryGirl.create(:airport3)
      expect(flight.destination).not_to be nil
    end
    it "should have departure airport" do
      flight = FactoryGirl.create(:flight)
      FactoryGirl.create(:airport4)
      expect(flight.departure).not_to be nil
    end
    it "should have an airline" do
      flight = FactoryGirl.create(:flight)
      FactoryGirl.create(:airline)
      expect(flight.airline).not_to be nil
    end
  end
  describe "Flight relationship with Booking" do
    it "should be related to booking" do
      FactoryGirl.create(:booking_with_passengers)
      flight = FactoryGirl.create(:flight)
      expect(flight.bookings).not_to be nil
    end
  end
end
