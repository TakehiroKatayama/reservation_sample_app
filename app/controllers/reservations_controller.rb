class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    Reservation.create!(reservation_params)
    redirect_to action: :index
  end

  private

  def reservation_params
    params.require(:reservation).permit(:shop_id, :count_person)
  end
end
