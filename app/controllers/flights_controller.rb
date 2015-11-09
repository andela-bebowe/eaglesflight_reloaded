class FlightsController < ApplicationController
  def index
    @flight_form = Flight.new
    @flight = Flight.search(params)
  end
  def all_flights
    @flights = Flight.all.paginate(page: params[:page], per_page: 1)
  end
end
