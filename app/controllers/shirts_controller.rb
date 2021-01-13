class ShirtsController < ApplicationController
  def index
    @shirts = current_user.shop.shirts
  end

  def new
    # check for valid shop
    if params[:shop_id] && shop = Shop.find_by(id: params[:shop_id])
      @shirt = shop.shirts.build
    else
      @shirt = Shirt.new
    end
  end

  def create
    @shirt = current_user.shop.shirts.build(shirt_params)

    # make sure all fields are filled in
    if empty_params?(shirt_params.to_h)
      flash[:message] = "Fields cannot be left blank"
      render :new
    else
      if @shirt.save
        redirect_to shop_shirts_path(current_user.shop)
      end
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
