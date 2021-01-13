class ShopsController < ApplicationController

  def show
    if is_current_users_shop?(params[:id])
      @shop = current_user.shop
    else
      render plain: "Invalid Shop ID"
    end
  end
end
