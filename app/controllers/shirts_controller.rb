class ShirtsController < ApplicationController
  def index
    @shirts = current_user.shop.shirts
  end

  def new
    if params[:shop_id] && shop = Shop.find_by(id: params[:shop_id])
      @shirt = shop.shirts.build
    else
      @shirt = Shirt.new
    end
  end

  def create
    @shirt = current_user.shop.shirts.build(shirt_params)
    if @shirt.save
      redirect_to shop_shirts_path(current_user.shop)
    else
      render :new
    end
  end

  def edit
    @shirt = Shirt.find_by(id: params[:id])
  end

  def update
    @shirt = Shirt.find_by(id: params[:id])

    if @shirt.update(shirt_params)
      redirect_to shop_shirts_path(@shirt.shop)
    else
      render :edit
    end
  end

  def destroy
    @shirt = Shirt.find_by(id: params[:id])

    redirect_to shop_shirts_path(@shirt.shop)
    @shirt.destroy
  end

  private
    def shirt_params
      params.require(:shirt).permit(:name, :description, :size, :color, :price_in_cents)
    end
end
