class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def show
    @user = User.find_by_id(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :shop_owner)
    end
end
