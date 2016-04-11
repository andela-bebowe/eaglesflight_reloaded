module BookingsHelper
  def setup_booking_form
    @booking_form = Booking.new
    @booking_form.passengers.build
    @num = params[:no_of_passengers].to_i
    setup_flight
  end

  def no_of_passengers_arr
    [[1,1], [2,2], [3,3], [4,4] ,[5,5]]
  end

  private
    def authenticate
      if !logged_in?
        flash[:warning] = "You have to log in to perform this action!"
        redirect_to root_url
      end
    end

    def booking_params
      params.require(:booking).
      permit(:plane_id, :flight_id, :no_of_passengers, :user_id, :cost,
      :paid_booking, passengers_attributes: [:name, :email])
    end

    def update_params
      params.require(:booking).
      permit(passengers_attributes: [:name, :email, :id])
    end

    def setup_flight
      @flight = Flight.find(params[:flight_id])
      @dest = @flight.destination
      @dept = @flight.departure
      @airline = @flight.airline
    end
end
