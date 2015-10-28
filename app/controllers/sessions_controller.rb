class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    log_in(user)
    redirect_to root_path
    flash[:notice] = "Signed In!"
  end

  def failure
    redirect_to root_path
    flash[:notice] = "Aunthentication failed, Try again"
  end

  def destroy
    log_out
    redirect_to root_path
    flash[:notice] = "Signed Out!"
  end
end
