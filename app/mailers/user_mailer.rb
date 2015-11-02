class UserMailer < ApplicationMailer
  def confirmation_email(user, booking)
    @booking = booking
    @user = user
    @url  = "http://eaglesflight-reloaded.herokuapp.com/"
    mail(to: @user.email, subject: "Booking Confirmation")
  end

  def update_email(user, booking)
    @booking = booking
    @user = user
    @url  = "http://eaglesflight-reloaded.herokuapp.com/"
    mail(to: @user.email, subject: "Booking Update Confirmation")
  end
end
