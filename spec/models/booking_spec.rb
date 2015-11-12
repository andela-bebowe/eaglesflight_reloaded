require "rails_helper"

RSpec.describe Booking, type: :model do
  describe Booking do
    it "creates with a passengers" do
      expect(FactoryGirl.build(:booking_with_passengers)).to be_valid
    end
  end
  describe "Booking relationship with flights" do
    it "should have flights associated with it" do
      booking = FactoryGirl.create(:booking_with_passengers)
      flight = FactoryGirl.create(:flight)
      expect(Booking.count).not_to eq 0
      expect(booking.flight).not_to be nil
      expect(booking.flight).to eq flight
    end
  end
end
