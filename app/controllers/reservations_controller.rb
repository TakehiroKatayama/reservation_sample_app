class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create!(reservation_params)
    # フォームに入力した予約テーブルに紐づく、ショップテーブルのカラム：キャパシティの値を呼び出す - フォームに入力した予約の人数
    @shop = @reservation.shop.capacity - reservation_params[:count_person].to_i
    # キャパシティーが0以上ならtrue
    if @shop >= 0
      # 変更されたshopのcapacityの値を更新
      @reservation.shop.update(capacity: @shop)
      redirect_to shops_index_path
    else
      # キャパシティがマイナスになる場合はfalse
      redirect_to action: :index
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:shop_id, :count_person)
  end
end
