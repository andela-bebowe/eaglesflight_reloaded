class SessionsController < ApplicationController
  def new
  end
  def create
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)
    log_in(user)
    redirect_to root_url
    flash[:success] = "Welcome #{current_user.name}, you are signed in!"
  end
  def failure
    render "new"
    flash[:warning] = "Authentication failed, Try again"
  end
  def destroy
    flash[:info] = "#{current_user.name} you are signed out!"
    log_out
    redirect_to root_url
  end
end
