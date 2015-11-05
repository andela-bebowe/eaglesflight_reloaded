class BookingsController < ApplicationController
  include BookingsHelper
  def new
    if params[:plane_id].blank?
      flash[:notice] = "Pick a flight"
      redirect_to root_path
    else
      setup_booking_form
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:info] = "Booking was successful."
      redirect_to @booking
    else
      flash[:info] = "Error occurred when booking"
      render "new"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if  @booking.update_attributes(params[:booking])
      flash[:info] = "Successfully updated project"
      redirect_to @booking
      UserMailer.update_email(current_user, @booking).deliver_now if logged_in?
    else
      flash[:notice] = "Update unsuccessful"
      render "edit"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    if logged_in?
      UserMailer.confirmation_email(current_user, @booking).deliver_now
    end
  end
end
