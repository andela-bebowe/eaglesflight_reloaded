class UsersController < ApplicationController
  def show
    if logged_in?
      @bookings = current_user.all_bookings.paginate(page: params[:page],
      per_page: 1)
    end
  end
end
