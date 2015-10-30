class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    log_in(user)
    render new_user_path
    flash[:success] = "Signed In!"
  end

  def failure
    redirect_to root_path
    flash[:warning] = "Aunthentication failed, Try again"
  end

  def destroy
    log_out
    redirect_to root_path
    flash[:info] = "Signed Out!"
  end
end
