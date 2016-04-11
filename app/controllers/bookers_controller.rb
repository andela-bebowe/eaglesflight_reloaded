class BookersController < ApplicationController
  def new
    @booker = Booker.new(express_token: params[:token])
  end

  def create
    booker = Booker.new(booker_params)
    booker.ip = request.remote_ip
    if booker.save
      if booker.purchase
        redirect_to booking_path(booker.booking)
        flash[:success] = "Booking was successfully paid for."
        booking_completed
      else
        flash[:warning] = "Ooops, Booking could not be paid for!"
      end
    else
      render :new
    end
  end

  def express_checkout
    generate_items
    response = EXPRESS_GATEWAY.setup_purchase(current_booking.build_booker.cost_in_cents, ip: request.remote_ip,
    return_url: "#{@host}#{new_booker_path}",
    cancel_return_url: "#{@host}#{root_url}",
    currency: "USD",
    allow_guest_checkout: true,
    item: [{name: "Eaglesflight Booking Ticket",
      description: "Destination: #{@dest}, Departure: #{@dept}"},
      number: @id, quantity: @no, price: @cost])
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  private
    def booker_params
      params.require(:booker).permit(:express_token, :booking_id)
    end
    def generate_items
      booker = current_booking.build_booker
      @booking = booker.booking
      @id = @booking.id
      @dest = @booking.flight_destination
      @dept = @booking.flight_departure
      @no = @booking.no_of_passengers
      @cost = booker.cost_in_cents/@no
      @host = ENV["app_host"]
    end
end
