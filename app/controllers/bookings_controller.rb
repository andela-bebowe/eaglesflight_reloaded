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
      if @booking.paid_booking
        store(@booking)
        render "booking_payments"
      else
        flash[:success] = "You just got yourself a free booking"
        redirect_to @booking
      end
    else
      flash[:warning] = "Error occurred when booking!."
      render "new"
    end
  end

  def find
    @booking = Booking.find_booking(params)
    if !@booking.blank?
      redirect_to edit_booking_url(@booking.id)
    else
      flash[:warning] = "This booking does not exist."
      redirect_to root_path
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
