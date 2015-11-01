class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    redirect_to root_path if params[:plane_id].nil?
    @plane  = Plane.obj(params[:plane_id])
    @flight = Flight.my_obj(@plane.flight_id)
    @num = params[:no_of_passengers].to_i
    @airline = Airline.my_obj(@plane.airline_id)
    @dest = Airport.position(@flight.destination_id)
    @dept = Airport.position(@flight.departure_id)
    @cost = number_to_currency(((@airline.price + @flight.price)* @num), :unit => "$")
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(:plane_id, passengers_attributes: [:name, :email] )
    end
end
