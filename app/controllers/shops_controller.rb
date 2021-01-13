class ShopsController < ApplicationController
  def show
    if params[:user_id] && is_current_user?(User.find_by(id: params[:user_id]))
      @shop = current_user.shop
    else
      redirect_to user_path(current_user)
      flash[:message] =  "Access denied."
    end
  end
end
