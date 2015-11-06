class BookingsController < ApplicationController
  include BookingsHelper
  before_filter :authenticate, :except => [ :new, :create, :show ]
  def new
    if params[:plane_id].blank?
      flash[:warning] = "Pick a flight"
      redirect_to root_path
    else
      setup_booking_form
    end
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booking was successful."
      redirect_to @booking
    else
      flash[:warning] = "Error occurred when booking!."
      render "new"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    flash[:info] = "Booking #{@booking.id} has been cancelled"
    @booking.destroy
    redirect_to root_path
  end

  def update
    @booking = Booking.find(params[:id])
    if  @booking.update_attributes(update_params)
      flash[:success] = "Booking #{@booking.id} successfully updated"
      redirect_to @booking
      UserMailer.update_email(current_user, @booking).deliver_now if logged_in?
    else
      flash[:warning] = "Update unsuccessful"
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
