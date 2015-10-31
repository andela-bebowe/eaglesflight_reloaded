class FlightsController < ApplicationController
  def index
    @flight_form = Flight.new
    @airports = Airport.locations
    @dates = Flight.formatted_departure_date
    @flight = Flight.search(params)
  end
end
