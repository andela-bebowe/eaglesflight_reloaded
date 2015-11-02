class UsersController < ApplicationController
  def show
    if logged_in?
      @bookings = current_user.all_bookings
    else
      flash[:notice] = "Unauthorised"
    end
  end
end
