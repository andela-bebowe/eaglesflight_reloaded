class UsersController < ApplicationController
  def new
  end

  private
    def user_params
      params.require(:user).permit(:provider, :uid, :name, :email, :profile_img)
    end
end
