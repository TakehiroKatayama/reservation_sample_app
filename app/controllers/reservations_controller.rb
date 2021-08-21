class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    Reservation.create!(reservation_params)
    # フォームに入力した予約に紐づくショップのキャパシティを呼び出す - フォームに入力した予約の人数
    @shop = @reservations.shop.capacity - params[:count_person]
    # キャパシティがマイナスになる場合はエラー
    # キャパシティーが0以上ならtrue
    # 変更されたshopのcapacityを保存
    @shop.save
    redirect_to action: :index
  end

  private

  def reservation_params
    params.require(:reservation).permit(:shop_id, :count_person)
  end
end
