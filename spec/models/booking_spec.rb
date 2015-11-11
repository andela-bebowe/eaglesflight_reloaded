require "rails_helper"

RSpec.describe Booking, type: :model do
  describe Booking do
    it "creates with a passengers" do
      FactoryGirl.create(:booking_with_passengers).should be_valid
      Booking.count.should_not == 0
    end
  end
  describe "Booking relationship with flights" do
    it "should have flights associated with it" do
      booking = FactoryGirl.create(:booking_with_passengers)
      flight = FactoryGirl.create(:flight)
      expect(booking.flight).not_to be nil
      expect(booking.flight).to eq flight
    end
  end
end
