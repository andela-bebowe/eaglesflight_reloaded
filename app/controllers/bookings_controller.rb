class BookingsController < ApplicationController
  include BookingsHelper
  def new
    @booking_form = Booking.new
    @booking_form.passengers.build
    @num = params[:no_of_passengers].to_i
    redirect_to root_path if params[:plane_id].nil?
    setup
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.valid?
      flash[:info] = "Booking was successful"
      redirect_to @booking
    else
      flash[:info] = "Error when booking"
    end
  end

  def edit
  end

  def update
  end

  def show
    @booking = Booking.find(params[:id])
    UserMailer.confirmation_email(current_user, @booking).deliver_now
  end
end
