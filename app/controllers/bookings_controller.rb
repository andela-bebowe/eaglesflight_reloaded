class BookingsController < ApplicationController
  def new
    @booking_form = Booking.new
    @booking_form.passengers.build
    redirect_to root_path if params[:plane_id].nil?
    @plane  = Plane.obj(params[:plane_id])
    @flight = Flight.my_obj(@plane.flight_id)
    @num = params[:no_of_passengers].to_i
    @airline = Airline.my_obj(@plane.airline_id)
    @price = Airline.my_price(@plane.airline_id)
    @dest = Airport.position(@flight.destination_id)
    @dept = Airport.position(@flight.departure_id)
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.valid?
      flash[:info] = "Booking was successful"
        binding.pry
      redirect_to @booking
    else
      flash[:info] = "Error when booking"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(:plane_id, :flight_id, :no_of_passengers, :user_id, :cost, passengers_attributes: [:name, :email])
    end
end
