class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @seat = Shop.remaining_seat
  end

  private

  def shop_params
    params.require(:shop).permit(:capacity)
  end
end
