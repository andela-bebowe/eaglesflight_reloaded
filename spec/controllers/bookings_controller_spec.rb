require "rails_helper"

RSpec.describe BookingsController, type: :controller do
  describe "GET new" do
    it "should respond with a 302 status code" do
      get :new
      expect(response.status).to eq(302)
    end
    it "should not allow booking without plane" do
      get :new, booking: FactoryGirl.attributes_for(:invalid_booking)

      expect(flash[:warning]).to eq("Pick a flight")
      expect(response).to redirect_to root_path
    end
  end
  describe "POST create" do
    it "should create a booking with passengers successfully" do
      post :create,booking: FactoryGirl.attributes_for(:booking_with_passengers)

      expect(flash[:success]).to eq("You just got yourself a free booking")
      expect(change(Booking, :booking).by (1))
      expect(response.status).to eq(302)
      expect(change(Booking, :booking).by (1))
      expect(response).to redirect_to Booking.last
    end
  end
  describe "GET #show" do
    it "should assign the requested booking" do
      booking = FactoryGirl.create(:booking)
      get :show, id: booking
      expect(assigns(:booking)).to eq(booking)
    end
    it "should render the show view" do
      booking = FactoryGirl.create(:booking)
      get :show, id: booking
      expect(response).to render_template :show
    end
  end
  describe "#destroy" do
    it "should delete the requested booking" do
      booking = FactoryGirl.create(:booking)
      expect { delete :destroy, id: booking }.to change(Booking, :count).by(-1)
    end
  end
end
