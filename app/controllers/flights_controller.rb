class FlightsController < ApplicationController
  def index
    @flight_form = Flight.new
    @flight = Flight.search(params)
  end
end
