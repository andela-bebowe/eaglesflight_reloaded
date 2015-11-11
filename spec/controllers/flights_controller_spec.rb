require "rails_helper"

RSpec.describe FlightsController, type: :controller do
  describe "GET index" do
    it "should respond with a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "should not allow booking without plane" do
      get :index

      expect(response).to render_template :index
    end
  end
  describe "GET all_flights" do
    it "should respond with a 200 status code" do
      get :all_flights
      expect(response.status).to eq(200)
    end
    it "should not allow booking without plane" do
      get :all_flights

      expect(response).to render_template :all_flights
    end
  end
end
