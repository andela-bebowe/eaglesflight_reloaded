module BookingsHelper
  def setup
    setup_plane
  end

  def no_of_passengers_arr
    [[1,1], [2,2], [3,3], [4,4] ,[5,5]]
  end

  private
    def booking_params
      params.require(:booking).
      permit(:plane_id, :flight_id, :no_of_passengers, :user_id, :cost,
      passengers_attributes: [:name, :email])
    end
    def setup_plane
      @plane  = Plane.obj(params[:plane_id])
      p_id = @plane.airline_id
      @flight = Flight.my_obj(@plane.flight_id)
      @airline = Airline.my_obj(p_id)
      @price = Airline.my_price(p_id)
      setup_airport(@flight)
    end
    def setup_airport(flight)
      @dest = Airport.position(flight.destination_id)
      @dept = Airport.position(flight.departure_id)
    end
end
